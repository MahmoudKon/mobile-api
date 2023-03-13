<?php

namespace App\Http\Services;

use App\Models\Badrshop;
use App\Models\Client;
use App\Models\ClientTransaction;
use App\Models\Invoice;
use App\Models\InvoiceDetails;
use App\Models\InvoiceDetailVat;
use App\Models\Item;
use App\Models\Log;
use App\Models\SalePoint;
use App\Models\StoreItem;
use Carbon\Carbon;
use Exception;
use Illuminate\Support\Facades\DB;

class InvoiceService
{
    protected Badrshop $shop;
    protected SalePoint $salePoint;
    protected Client $client;
    protected Invoice $invoice;
    protected $type;
    protected array $details = [];
    protected array $saved_invoices = [];

    public function __construct()
    {
        $this->shop = Badrshop::first();
    }

    public function handler(array $data = [], int $type = 1)
    {
        try {
            DB::beginTransaction();
                $this->type = $type;
                foreach ($data['bills'] as $bill) {
                    $this->resetProperties();
                    $this->salePoint = SalePoint::select('store_id', 'id', 'currency_id')->whereId($bill['sale_point'])->first();
                    $this->client = Client::find($bill['client_id']);
                    $this->updateClientBalance($bill);
                    $this->updateSalePointBalance($bill);
                    $this->createInvoice($bill);
                    $this->itemsProcess($bill['sale_details']);
                    $this->createTransaction();

                    $this->newInvoiceLog();
                    $this->saved_invoices[] = ['bill_no' => $this->invoice->bill_no, 'bill_id' => $this->invoice->id];
                }
            DB::commit();

            return ['status' => 200, 'bills' => $this->saved_invoices];
        } catch (Exception $e) {
            return ['status' => 500, 'message' => $e->getMessage()];
        }
    }
    
    protected function updateClientBalance(array $bill): void
    {
        if ($this->type == Invoice::SALES)
            $this->client->increment('balance', $bill['total'] - $bill['payment']);
        else
            $this->client->decrement('balance', $bill['total'] - $bill['payment']);

        $this->client->refresh();
    }

    protected function updateSalePointBalance(array $bill): void
    {
        if ($this->type == Invoice::SALES)
            $this->salePoint->increment('money_point', $bill['total']);
        else
            $this->salePoint->decrement('money_point', $bill['total']);
        
        $this->salePoint->refresh();
    }

    protected function createInvoice(array $bill): void
    {
        $this->invoice = Invoice::create([
            'transaction_date'          => now(),
            'invoice_date'              => Carbon::parse($bill['date_time']),
            'local_bill_no'             => $bill['local_bill_no'],
            'store_id'                  => $this->salePoint->store_id,
            'currency_id'               => $this->salePoint->currency_id,
            'invoice_type'              => $this->type,
            'shop_id'                   => shopId(),
            'bill_no'                   => Invoice::max('bill_no') + 1,
            'bill_total'                => $bill['net'],
            'net_price'                 => $bill['total'],
            'bill_total'                => $bill['total'],
            'payment'                   => $bill['payment'],
            'bill_payment'              => $bill['payment'],
            'rest'                      => $bill['total'] - $bill['payment'],
            'balance'                   => $this->client->balance,
            'client_id'                 => $bill['client_id'],
            'add_user'                  => $bill['user_id'] ?? 0,
            'invoice_total_disc_status' => $this->shop->company_ratio == 2 ? 0 : 1,
            'insatllments_add'          => $bill['installment_add_precent'] ?? 0,
            'supplier_invoice_no'       => $bill['supplier_invoice_no'] ?? null,
            'reference_id'              => $bill['reference_id'] ?? 0,
            'fee'                       => $bill['delivery_fees'] ?? 0,
            'fee_status'                => $this->shop->add_delivery_fees_to_the_cash_drawer,
            'sales_man'                 => 0,
            'invoice_total_disc'        => $bill['discountCashValue'],
            'invoice_total_disc_type'   => $bill['discount_type'],
            'bill_service_id'           => 0,
            'bill_service_value'        => 0,
            'delivery_option_id'        => 0,
            'delivery_period_id'        => 0,
            'delivery_option_value'     => 0,
            'delivery_man_id'           => 0,
            'submissionId'              => '',
            'uuid'                      => '',
            'longId'                    => '',
            'internalId'                => '',
            'hashKey'                   => '',
        ]);
    }

    protected function itemsProcess(array $items): void
    {
        foreach ($items as $item) {
            $item_obj = Item::find($item['item_id']);
            $item['real_quantity'] = $item['unitValue'] * $item['quantity'];
            $this->updateUnitQuantity($item);
            $this->createInvoiceDetails($item);
            if ($item_obj->vat_id !== 0)
                $this->createInvoiceItemVat($item_obj, $item);
        }

        InvoiceDetails::insert($this->details);
    }

    protected function updateUnitQuantity(array $item): void
    {
        $query = StoreItem::where(['item_id' => $item['item_id'], 'store_id' => $this->salePoint->store_id]);
        if ($this->type == Invoice::SALES)
            $query->decrement('store_quant', $item['real_quantity']);
        else
            $query->increment('store_quant', $item['real_quantity']);
    }

    protected function createInvoiceDetails(array $item): void
    {
        $row = Item::select('id', 'sale_price')->find($item['item_id']);
        $this->details[] = [
            'shop_id'          => shopId(),
            'invoice_id'       => $this->invoice->id,
            'safe_point_id'    => $this->salePoint->id,
            'add_user'         => authId(),
            'item_id'          => $item['item_id'],
            'quantity'         => $item['quantity'],
            'unit_id'          => $item['unit_id'],
            'net_price'        => $item['price'],
            'pay_price'        => $item['price'],
            'total_price'      => $item['price'],
            'sale_price'       => $row->sale_price,
            'basic_sale_price' => $row->sale_price,
            'basic_pay_price'  => $row->sale_price,
            'item_about'       => '',
        ];
    }

    protected function createInvoiceItemVat(Item $item, array $item_detail): void
    {
        InvoiceDetailVat::create([
            'invoice_id'    => $this->invoice->id,
            'item_id'       => $item->id,
            'unit_id'       => $item_detail['unit_id'],
            'vat_id'        => $item->vat_id,
            'vat_type'      => $item->vat_type ?? 0,
            'vat_operation' => $item->vat_operation ?? 0,
            'vat_value'     => $item->vat_value ?? 0,
            'vat_weight'    => $item->pay_vats_weight ?? 0,
        ]);
    }

    protected function createTransaction(): void
    {
        ClientTransaction::create([
            'user_id'           => authId(),
            'amount'            => $this->salePoint->money_point ?? 0,
            'pay_day'           => $this->invoice->invoice_date,
            'notes'             => $this->invoice->notes,
            'date_time'         => day_now($this->shop->date_type),
            'bill_net_total'    => $this->invoice->net_price,
            'bill_id'           => $this->invoice->id,
            'balance'           => $this->client->balance,
            'client_id'         => $this->client->id,
            'safe_point_id'     => $this->salePoint->id,
            'safe_balance'      => $this->salePoint->money_point,
            'type'              => 1,
            'sale_back_id'      => 0,
            'problem_id'        => 0,
            'effect'            => 0,
            'supplier_id'       => 0,
            'salary_month'      => 0,
            'OutTransactionID'  => 0,
            'spend_id'          => 0,
        ]);
    }

    protected function newInvoiceLog()
    {
        Log::create(['event' => trans('log.new_sale_invoice') . trans('log.invoice_no') . $this->invoice->id, 'type' => $this->invoice->type ?? 0 ]);
    }

    protected function resetProperties()
    {
        $this->salePoint = new SalePoint();
        $this->client = new Client();
        $this->invoice = new Invoice();
        $this->details = [];
    }
}

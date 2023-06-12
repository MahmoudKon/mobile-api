<?php

namespace App\Http\Services;

use App\Http\Requests\Api\NewRequestRequest;
use App\Models\Badrshop;
use App\Models\Client;
use App\Models\Item;
use App\Models\Log;
use App\Models\NewRequest;
use App\Models\NewRequestDetail;
use App\Models\SalePoint;
use App\Models\Store;
use Carbon\Carbon;
use Exception;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class NewRequestService
{
    protected Badrshop $shop;
    protected SalePoint $salePoint;
    protected Store $store;
    protected Client $client;
    protected NewRequest $request;
    protected $type;
    protected $items;
    protected array $details = [];
    protected array $saved_requests = [];

    public function __construct()
    {
        $this->shop = Badrshop::select('serial_id', 'company_ratio', 'add_delivery_fees_to_the_cash_drawer', 'date_type')->first();
    }

    public function handler(array $data = [], int $type = 1)
    {
        $this->type = $type;
        \Illuminate\Support\Facades\Log::info(json_encode($data));
        try {
            DB::beginTransaction();
                foreach ($data['requests'] as $request) {
                    $result = Validator::make($request, (new NewRequestRequest())->single_rules());
                    if ($result->fails()) continue;

                    // if ($id = $this->checkRequestExists($request)) {
                    //     $this->saved_requests[] = ['receipt_number' => $request['receipt_number'], 'bill_id' => $id];
                    //     continue;
                    // }

                    $this->resetProperties(); // make all properties null
                    $this->salePoint = SalePoint::select('id', 'currency_id', 'money_point')->whereId( salePointId() )->first();
                    $this->store     = Store::select('id')->whereId( $request['store_id'] )->first();
                    $this->client    = Client::select('id', 'balance', 'price')->find($request['client_id']);
                    $this->items     = collect( $request['items'] );
                    $this->calculateItemsNetQuantity();

                    // To create new invoice
                    $this->createRequest($request);

                    $this->itemsProcess();

                    // To create invoice log
                    $this->newInvoiceLog();
                    $this->saved_requests[] = ['receipt_number' => $this->request->no_bill, 'bill_id' => $this->request->id];
                }
            DB::commit();

            return ['status' => 200, 'data' => $this->saved_requests];
        } catch (Exception $e) {
            return ['status' => 500, 'message' => $e->getMessage()];
        }
    }

    protected function calculateItemsNetQuantity()
    {
        $this->items->each(function($item, $index) {
            $item['net_quantity'] = $this->calc($item);
            $item['price']        = $item['net_quantity'] * $this->client->price;
            $this->items[$index] = $item;
        });
    }

    protected function calc($item)
    {
        $water   = $item['quantity'] * ($item['water'] / 100);
        $protein = $item['quantity'] * ($item['protein'] / 100);
        $fats    = $item['quantity'] * ($item['fats'] / 100);
        return $item['quantity'] - ($water + $protein + $fats);
    }

    protected function createRequest(array $request): void
    {
        $net = $this->items->sum('price');
        $this->request   = NewRequest::create([
            'user_id'    => authId(),
            'client_id'  => $this->client->id,
            'total'      => $net,
            'net'        => $net,
            'no_bill'    => $request['receipt_number'],
            'order_no'   => NewRequest::getMax(),
            'type'       => 1,
            'rest'       => 0,
            'created_at' => Carbon::parse($request['date_time']),
        ]);
    }

    protected function itemsProcess(): void
    {
        foreach ($this->items as $item) {
            $this->createInvoiceDetails($item);
        }

        NewRequestDetail::insert($this->details);
    }

    protected function createInvoiceDetails(array $item): void
    {
        $this->details [] = [
                    'shop_id'          => shopId(),
                    'request_id'       => $this->request->id,
                    'item_id'          => $item['item_id'],
                    'quantity'         => $item['net_quantity'],
                    'price'            => $item['price'],
                    'unit_id'          => Item::select('unit_id')->find($item['item_id'])->unit_id ?? 0,
                    'water'            => $item['water'],
                    'protein'          => $item['protein'],
                    'fats'             => $item['fats'],
                ];
    }

    protected function checkRequestExists(array $request)
    {
        return NewRequest::select('id')->where('created_at', Carbon::parse($request['date_time']))
                            ->where('store_id', $request['store_id'])->where('client_id', $request['client_id'])
                            ->where('no_bill', $request['receipt_number'])->first()->id ?? false;
    }

    protected function newInvoiceLog()
    {
        Log::create(['event' => trans('log.new_sale_invoice') . trans('log.invoice_no') . $this->request->id, 'type' => $this->type]);
    }

    protected function resetProperties()
    {
        $this->salePoint = new SalePoint();
        $this->store   = new Store();
        $this->client  = new Client();
        $this->request = new NewRequest();
        $this->details = [];
        $this->items   = collect();
    }
}

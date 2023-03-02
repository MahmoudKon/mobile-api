<?php

namespace App\Http\Controllers\Api\Rep;

use App\Http\Controllers\BasicApiController;
use App\Http\Requests\Api\InvoiceRequest;
use App\Http\Resources\InvoicesResource;
use App\Http\Services\BackBillService;
use App\Models\Badrshop;
use App\Models\BillAdd;
use App\Models\BillAddHistory;
use App\Models\Invoice;
use Illuminate\Support\Facades\DB;

class InvoiceController extends BasicApiController
{
    public function sales()
    {
        return $this->returnData(InvoicesResource::collection( $this->query(1) ));
    }

    public function backSales()
    {
        return $this->returnData(InvoicesResource::collection( $this->query(3) ));
    }

    public function purchases()
    {
        return $this->returnData(InvoicesResource::collection( $this->query(0) ));
    }

    public function backPurchases()
    {
        return $this->returnData(InvoicesResource::collection( $this->query(2) ));
    }

    public function query(int $type = 1)
    {
        return Invoice::select('id', 'bill_no', 'client_id', 'invoice_date', 'net_price', 'local_bill_no')->with('client')->where('invoice_type', $type)
                ->withCount('details')->with('client')->whereDate('invoice_date', request()->get('date', date('Y-m-d')))->get();
    }

    public function additions()
    {
        $p_scale = Badrshop::select('decimal_num_price')->where('serial_id', $this->shop_id)->first()->decimal_num_price;
        $rows = BillAdd::select('id', 'addition_name as name', 'check_addition as type', DB::raw("TRUNCATE(addition_value, $p_scale) as value"))->whereIn('add_role', [0, 1])->where('check_bill_type', '!=', 2)->get()->toArray();
        return $this->returnData($rows);
    }

    public function store(InvoiceRequest $request, BackBillService $service)
    {
        $response = $service->handler($request->validated());
        if ($response['status'] == 200) return $this->sendResponse(result: $response['data']);
        return $this->sendError($response['message']);
    }

    public function show($id)
    {
        $shop = Badrshop::select('currency', 'bill_adds')->where('serial_id', shopId())->first();

        $bill = Invoice::select('id', 'bill_no', 'invoice_date', 'net_price', 'local_bill_no', 'client_id', 'payment', 'invoice_total_disc', 'invoice_total_disc_type')
                                ->with('client', 'details')->where('id', $id)->first();

        if (! $bill) return $this->sendError('This bill not found');

        $bill->discount = $bill->invoice_total_disc > 0 ? ($bill->invoice_total_disc . ' ' . ($bill->invoice_total_disc_type ? " $shop->currency " : ' % ')) : '0';
        $bill->adds = $this->getBillAdds($shop, $id);

        return $this->sendResponse(result: ['data' => $bill]);
    }

    protected function getBillAdds($shop, $id)
    {
        $adds = [];
        if ($shop->bill_adds == 0) {
            $rows = BillAddHistory::select('addition_value', 'bill_add', 'add_type', 'addition_id')->where('bill_id', $id)->with('addition')->get();
            foreach ($rows as $row) {
                $adds[] = [
                    'name' => $row->addition->name,
                    'add' => $row->getBillAddText($shop->currency),
                    'value' => $row->addition_value,
                ];
            }
        }
        return $adds;
    }
}

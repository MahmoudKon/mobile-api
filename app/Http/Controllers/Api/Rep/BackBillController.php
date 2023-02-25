<?php

namespace App\Http\Controllers\Api\Rep;

use App\Http\Controllers\BasicApiController;
use App\Http\Requests\Api\InvoiceRequest;
use App\Http\Resources\SaleBackInvoiceResource;
use App\Http\Services\BackBillService;
use App\Models\Badrshop;
use App\Models\BillAddHistory;
use App\Models\SaleBackInvoice;

class BackBillController extends BasicApiController
{
    public function index()
    {
        $rows = SaleBackInvoice::select('id', 'bill_no', 'sale_date', 'net_price', 'local_bill_no', 'client_id')->with('client')->withCount('details')->get();
        
        return $this->returnData(SaleBackInvoiceResource::collection($rows));
    }

    public function store(InvoiceRequest $request, BackBillService $service)
    {
        $response = $service->handler($request->validated());
        if ($response['status'] == 200) return $this->sendResponse(result: $response['data']);
        return $this->sendError($response['message']);
    }

    public function show($id)
    {
        $shop = Badrshop::select('currency', 'bill_adds')->where('serial_id', auth()->user()->shop_id)->first();

        $bill = SaleBackInvoice::select('id', 'bill_no', 'sale_date', 'net_price', 'local_bill_no', 'client_id', 'payment', 'discount', 'discount_type')
                                ->with('client', 'details')->where('id', $id)->first();

        if (! $bill) return $this->sendError('This bill not found');

        $bill->adds = $this->getBillAdds($shop);

        return $this->sendResponse(result: ['data' => $bill]);
    }

    protected function getBillAdds($shop)
    {
        $adds = [];
        if ($shop->bill_adds == 0) {
            $rows = BillAddHistory::select('addition_value', 'bill_add', 'add_type', 'addition_id')->with('addition')->get();
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

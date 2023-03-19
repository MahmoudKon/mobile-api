<?php

namespace App\Http\Controllers\Api\Rep;

use App\Http\Controllers\BasicApiController;
use App\Http\Resources\InvoicesResource;
use App\Http\Services\InvoiceService;
use App\Models\BillAdd;
use App\Models\BillAddHistory;
use App\Models\Invoice;
use Illuminate\Http\Request;

class InvoiceController extends BasicApiController
{
    public function additions()
    {
        $rows = BillAdd::select('id', 'addition_name as name', 'check_addition as type', 'addition_value as value')->whereIn('add_role', [0, 1])->where('check_bill_type', '!=', 2)->get()->toArray();
        return $this->returnData($rows);
    }

    public function sales()
    {
        return $this->returnData(InvoicesResource::collection( $this->query( Invoice::SALES ) ));
    }

    public function backSales()
    {
        return $this->returnData(InvoicesResource::collection( $this->query( Invoice::BACK_SALES ) ));
    }

    public function purchases()
    {
        return $this->returnData(InvoicesResource::collection( $this->query( Invoice::PURCHASES ) ));
    }

    public function backPurchases()
    {
        return $this->returnData(InvoicesResource::collection( $this->query( Invoice::BACK_PURCHASES ) ));
    }

    public function query(int $type = 1)
    {
        return Invoice::select('id', 'bill_no', 'client_id', 'invoice_date', 'net_price', 'local_bill_no')->with('client')->where('invoice_type', $type)
                ->withCount('details')->with('client')->whereDate('invoice_date', request()->get('date', date('Y-m-d')))->get();
    }

    public function newBill(Request $request, InvoiceService $service)
    {
        $response = $service->handler($request->all(), Invoice::SALES);
        if ($response['status'] == 200) return $this->sendResponse(result: ['data' => $response['data']]);
        return $this->sendError($response['message']);
    }

    public function newBackBill(Request $request, InvoiceService $service)
    {
        $response = $service->handler($request->all(), Invoice::BACK_SALES);
        if ($response['status'] == 200) return $this->sendResponse(result: ['data' => $response['data']]);
        return $this->sendError($response['message']);
    }

    public function show($id)
    {
        $shop = shop();

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

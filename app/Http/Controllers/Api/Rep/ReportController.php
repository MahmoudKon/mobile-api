<?php

namespace App\Http\Controllers\Api\Rep;

use App\Http\Controllers\BasicApiController;
use App\Http\Resources\ClientTransactionResource;
use App\Models\ClientTransaction;
use App\Models\SalePoint;
use Illuminate\Support\Facades\DB;

class ReportController extends BasicApiController
{
    public function index()
    {
        $p_scale = DB::table('badr_shop')->select('decimal_num_price')->where('serial_id', shopId())->first()->decimal_num_price;
        $date = request()->get('date', date('Y-m-d'));

        $rows = ClientTransaction::select('id', 'pay_day', 'effect', 'bill_id', 'type', 'amount', 'user_id', 'client_id', 'safe_balance')->with('user', 'client', 'invoice')
                            ->where('pay_day', $date)->where('amount', '>', 0)->get();

        if (count($rows) == 0) return $this->sendError('No Data Found');

        $rows = $rows->merge([$this->getPreviousDetails($rows->first(), $p_scale)]);
        $money_point = SalePoint::select('money_point')->first()->money_point;
        return $this->sendResponse(result: ['data' => ClientTransactionResource::collection($rows), 'money_point' => $money_point]);
    }

    protected function getPreviousDetails(ClientTransaction $row, int $p_scale = 2)
    {
        $previous_balance = $row->safe_balance;
        $process = $row->effect == 1 ? '-' : '+';
        $previous_balance = eval("return $previous_balance $process $row->amount;");

        $prev = new ClientTransaction();
        $prev->id = "";
        $prev->pay_day = "";
        $prev->amount = "";
        $prev->effect = 2;
        $prev->safe_balance = number_format($previous_balance, $p_scale);
        $prev->type = 101;
        $prev->user = '';
        return $prev;
    }
}

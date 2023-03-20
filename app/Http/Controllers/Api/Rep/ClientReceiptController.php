<?php

namespace App\Http\Controllers\Api\Rep;

use App\Http\Controllers\BasicApiController;
use App\Http\Requests\ReceiptRequest;
use App\Http\Resources\ClientReceiptResource;
use App\Models\Client;
use App\Models\ClientTransaction;
use App\Models\SalePoint;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class ClientReceiptController extends BasicApiController
{
    public function index()
    {
        $rows = ClientTransaction::select('id', 'amount', 'type', 'pay_day', 'balance', 'bill_id', 'client_id', 'date_time', 'notes')->perClient(request()->get('client_id'))->with('invoice', 'client')->whereIn('type', [0, 1, 2, 4, 8, 9])->get();
        return $this->returnData(ClientReceiptResource::collection($rows));
    }

    public function store(ReceiptRequest $request)
    {
        try {
            DB::beginTransaction();
                $user_sale_point = SalePoint::select('id', 'money_point')->whereId(salePointId())->first();
                foreach ($request->details as $index => $detail) {
                    $client = Client::select('id', 'balance')->find($detail['client_id']);
                    if ($detail['type'] == 1) {
                        $effect = 0;
                        $transaction_type = 9;
                        $client->increment('balance', $detail['amount']);
                        $user_sale_point->decrement('money_point', $detail['amount']);
                    } else {
                        $effect = 1;
                        $transaction_type = 2;
                        $client->decrement('balance', $detail['amount']);
                        $user_sale_point->increment('money_point', $detail['amount']);
                    }

                    $transactions [$index] =[
                        'date_time'     => Carbon::parse($detail['date']),
                        'client_id'     => $detail['client_id'],
                        'bill_id'       => $detail['bill_id'] ?? 0,
                        'amount'        => $detail['amount'],
                        'type'          => $transaction_type,
                        'effect'        => $effect,
                        'pay_day'       => Carbon::parse($detail['date']),
                        'balance'       => $client->balance,
                        'user_id'       => authId(),
                        'shop_id'       => shopId(),
                        'safe_point_id' => $user_sale_point->id,
                        'safe_balance'  => $user_sale_point->money_point,
                        'safe_type'     => $user_sale_point->point_type,
                        "sale_back_id"  => 0,
                        "problem_id"    => 0,
                        "supplier_id"   => 0,
                        "salary_month"  => 0,
                        "OutTransactionID" => 0,
                        "spend_id"      => 0,
                    ];
                }
                ClientTransaction::insert($transactions);
            DB::commit();
            return $this->sendResponse('تمت العملية بنجاح');
        } catch (\Exception $e) {
            DB::rollBack();
            return $this->sendError($e->getMessage());
        }
    }
}

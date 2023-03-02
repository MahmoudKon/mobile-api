<?php

namespace App\Http\Controllers\Api\Rep;

use App\Http\Controllers\BasicApiController;
use App\Http\Requests\Api\SpendRequest;
use App\Http\Resources\SpendingResource;
use App\Models\ClientTransaction;
use App\Models\SalePoint;
use App\Models\Spending;
use App\Models\SpendItem;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

class SpendController extends BasicApiController
{
    public function index()
    {
        $rows = SpendItem::select('id', 'name')->get()->toArray();
        return $this->returnData($rows);
    }

    public function store(SpendRequest $request)
    {
        try {
            DB::beginTransaction();
                $sale_point = SalePoint::select('id', 'money_point')->whereId(salePointId())->first();

                $validated = array_merge($request->validated(), ['sale_point_id' => $sale_point->id]);

                $row = $this->createSpend( $validated );

                $validated['money_point'] = $sale_point->money_point - $request->amount;

                $sale_point->decrement('money_point', $validated['amount']);

                $this->createClientTransation($validated);
            DB::commit();
            return $this->sendResponse('تم الحفظ بنجاح', ['data' => new SpendingResource($row)]);
        } catch (\Exception $e) {
            DB::rollBack();
            return $this->sendError($e->getMessage());
        }
    }

    protected function createSpend(array $validated): Spending
    {
        return Spending::create([
            'spend_id' => $validated['term_id'],
            'spend_date' => $validated['date'],
            'amount' => $validated['amount'],
            'spend_type' => 1,
            'spend_for' => 0,
            'sale_point' => $validated['sale_point_id'],
            'note' => $validated['notes'],
            'bill_add_id' => 0,
            'vat_value' => 0,
            'spend_file' => $this->uploadFile(request()->get('file')),
            'is_confirmed' => 1,
            'bill_no' => 0,
            'local_id' => $validated['local_id']
        ]);
    }

    protected function createClientTransation(array $validated): void
    {
        ClientTransaction::create([
            'date_time' => now(),
            'amount' => $validated['amount'],
            'type' => 10,
            'effect' => 0,
            'pay_day' => $validated['date'],
            'safe_balance' => $validated['money_point'],
            'safe_point_id' => $validated['sale_point_id'],
            'notes' => $validated['notes'],
            'spend_id' => $validated['term_id'],
            'user_id' => auth()->id(),
            'client_id' => auth()->id(),
            'balance' => 0,
            'bill_id' => 0,
            'sale_back_id' => 0,
            'problem_id' => 0,
            'supplier_id' => 0,
            'salary_month' => 0,
            'OutTransactionID' => 0,
        ]);
    }

    protected function uploadFile($file = null): string
    {
        if (! $file) return '';
        $file_name = date("Y-m-d") . '_' . time() . '.' . strtolower($file->getClientOriginalExtension());
        $name_one = shopId() . '/spending/';
        $destinationPath = config('app.img_url').$name_one;
        File::isDirectory($destinationPath) or File::makeDirectory($destinationPath, 0755, true, true);
        $file->move($destinationPath, $file_name);
        return $name_one . $file_name;
    }
}

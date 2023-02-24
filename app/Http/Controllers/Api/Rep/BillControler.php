<?php

namespace App\Http\Controllers\Api\Rep;

use App\Http\Controllers\BasicApiController;
use App\Http\Resources\BillAddResource;
use App\Models\Badrshop;
use App\Models\BillAdd;
use App\Models\SalePoint;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class BillControler extends BasicApiController
{
    public function additions()
    {
        $p_scale = Badrshop::select('decimal_num_price')->where('serial_id', $this->shop_id)->first()->decimal_num_price;
        $rows = BillAdd::select('id', 'addition_name as name', 'check_addition as type', DB::raw("TRUNCATE(addition_value, $p_scale) as value"))->whereIn('add_role', [0, 1])->where('check_bill_type', '!=', 2)->get()->toArray();
        return $this->returnData($rows);
    }
    public function newBill(Request $request)
    {
        $validation = $this->validateRequest($request->all());
        if (count($validated['errors']) > 0) return $this->sendError(errorMessages: $validated['errors']);

        $calculate = $this->calculate($request->bills, $shop_id);

        return [
            'status' => true,
            'data' => $calculate
        ];
    }

    public function show(Request $request, $id)
    {

        if ($validation->fails()) {
            $errors = $validation->errors();
            $error_data = [];
            foreach ($errors->all() as $error) {
                array_push($error_data, $error);
            }
            $data = $error_data;
            $response = [
                'status' => false,
                'error' => $data,
                // 'msg' => 'من فضلك أدخل جميع الحقول وتأكد من صحة رقم الهاتف',
            ];
            return response()->json($response);
        }
        $bill_id = $request->bill_id;
        $shop_id = auth()->guard('rep')->user()->shop_id;
        $shop = BadrShop::where('serial_id', $shop_id)->first();

        $setting = RequestSettings::where('shop_id', $shop_id)->first();
        if (is_null($setting)) {
            $setting = new RequestSettings();
            $setting->fee = 0;
            $setting->min_purchase = 0;
            $setting->max_charge = 0;
            $setting->shop_id = $shop_id;
            $setting->save();
        }

        //        $req_ = BadrRequest::findOrFail($id);


        //        $req_id = $req_->id;

        //        $mandobeen = \DB::table('users')->where('shop_id', auth()->guard('rep')->user()->shop_id)->where('type', 1)->get();

        //        $bill = SaleProcess::find($request->bill_id);
        $bill = SaleProcess::where('id', $bill_id)
            ->where('shop_id', $shop_id)
            ->selectRaw('id, bill_no, sale_date as date, client_id, net_price, payment, FORMAT(discount, 2) as discount, discount_type')
            ->first();

        if (is_null($bill)) {
            return response()->json([
                'status' => false,
                'message' => 'no data'
            ], 200);
            //            return redirect('/requests/request-details/' . $req_->id);
        }

        if ($bill->discount_type == 0) {
            $bill->discont = $bill->net_price * $bill->discont / 100;
        }

        //        $shop = \DB::table('badr_shop')->where('serial_id', auth()->guard('rep')->user()->shop_id)
        //            ->select('logo_path', 'serial_id', 'shop_name')->first();
        //        $v = \DB::table('bill_setting')->where('shop_id', $shop->serial_id)->first();
        //        if ($v) {
        //            $shop->vat_number = $v->vat_number;
        //        } else {
        //            $shop->vat_number = '';
        //        }

        //        $adds = RequestAddHistory::where('bill_id', $bill_id)
        //            ->where('shop_id', $shop_id)
        ////            ->sum('addition_value');
        //            ->get();

        $adds = BillAddHistory::where([
            'bill_id' => $bill_id,
            'shop_id' => $shop_id,
            'type' => 1
        ])
            ->select('addition_value', 'addition_id')->get();
        $arr = collect();
        foreach ($adds as $add) {

            $add_ = BillAdd::where('shop_id', $shop_id)->where('id', $add->addition_id)
                ->select('id', 'Addition_name', 'addition_value', 'check_addition')->first();

            $name = $add_->Addition_name ?? '';
            $add->name = $name;
            $add->addition_value = price_decimal($add->addition_value, $shop_id);;
            //            $row->pay_price = price_decimal($row->pay_price, $shop_id);
            //
            //            $row->quantity =  quant_decimal($row->quantity, $shop_id);
            $val = number_format($add_->addition_value, $shop->decimal_num_price, ".", "");

            //            $add->type = $add_->check_addition;
            if ($add_->check_addition == 1) {
                $s = $shop->currency;
            } else {
                $s = '%';
            }
            $add->col = $val . ' ' . $s;
            unset($add->addition_id);
            $arr->push($add);
        }
        $details = SaleDetails::where('sale_details.shop_id', $shop_id)
            ->where('sale_id', $bill_id)
            ->join('items', 'sale_details.items_id', '=', 'items.id')
            ->select('sale_details.id as id', 'items_id', 'items.item_name', 'sale_details.quantity', 'price', 'total_price')
            //            ->select('items_id', 'sale_id', 'id', 'total_price', 'quantity', 'date_sale', 'item_name', 'unit', 'price')
            ->get();

        foreach ($details as $detail) {
            $detail->price = price_decimal($detail->price, $shop_id);
            $detail->total_price = price_decimal($detail->total_price, $shop_id);

            $detail->quantity = quant_decimal($detail->quantity, $shop_id);
        }
        $bill->client_name = $bill->client->client_name ?? "";
        $bill->adds = $arr;
        $bill->details = $details;
        unset($bill->client);
        //        $data = [
        //            "bill" => $bill,
        //            "adds" => $adds,
        //            "details" => $details,
        //        ];
        return response()->json([
            'status' => true,
            'data' => $bill
        ], 200);
        $data = $this->createBillData($req_->no_bill);
        return view('badrrequest::bill-data', compact('data', 'shop'));
    }

    public function calculate($bills, $shop_id)
    {
        $adds = Badrshop::select('bill_adds')->where('serial_id', $this->shop_id)->first()->bill_adds ?? 0;
        $sale = SalePoint::select('id', 'store_id')->whereId($this->sale_point)->first();
        $text = [];

        foreach ($bills as $bill) {
            $no_vat = 0;
            $for_vat = 0;
            $details = [];

            foreach ($bill['sale_details'] as $data) {
                $item = Item::select('id', 'vat_state', 'vat_id', 'sale_price', 'pay_price')->find($data['item_id']);
                $vat_state = $item->vat_state;
                $vat_id = $item->vat_id;
                $item_price = $data['price'];
                $item_quantity = $data['quantity'];
                $item_total = $item_price * $item_quantity;
                $ready_item = [
                    'item_id' => $item->id,
                    'quantity' => $item_quantity,
                    'price' => $item_price,
                    'basic_price' => $item->sale_price,
                    'total' => $item_total,
                    'pay_price' => $item->pay_price,
                    'sale_point' => $sale->id,
                    'unit' => $data['unit_id'],
                    'vat_state' => $item->vat_state
                ];

                array_push($details, $ready_item);

                if ($vat_state == 0) {
                    $no_vat += $item_total;
                }
                if ($vat_state == 1) {
                    $for_vat += $item_total;
                }
                if ($vat_state == 2) {
                    if ($adds == 0) {
                        $vat_value = BillAdd::where('id'. $vat_id)->first()->addition_value;
                        $n_total = $item_total / (1 + ($vat_value / 100));
                        $for_vat += $n_total;
                    } else {
                        $for_vat += $item_total;
                    }
                }
            }
            $total_before_vat = $no_vat + $for_vat;
            $discount = $bill['discount'];
            $discount_percent = $bill['discount'];
            $discount_type = $bill['discount_type'];
            // dd($discount);
            if ($discount_type == 1) { // money
                if ($discount > 0) {
                    $discount_percent = $discount * 100 / $total_before_vat;  // money to percent
                }
            }
            // dd($discount_percent);

            $for_vat_after_discount = $for_vat;
            $percent_vat = 0;
            $service_vat = 0;
            $vats = array();

            if ($adds == 0) {
                $bill_add = BillAdd::whereIn('add_role', ['0', '1'])->get();

                foreach ($bill_add as $add) {
                    $vat = BillAdd::where([
                        'shop_id' => $this->shop_id,
                        'id' => $add->id
                    ])->first();
                    if ($vat->check_addition == 0) {
                        $vat_value = $vat->addition_value / 100 * $for_vat_after_discount;
                        $percent_vat += $vat_value;
                        $vat_value_discount = $vat_value * $discount_percent / 100;
                        $vat_value_after_discount = $vat_value - $vat_value_discount;
                        $vats[$vat->id] = $vat_value_after_discount;
                    } else {
                        $service_vat += $vat->addition_value;
                        $vats[$vat->id] = $vat->addition_value;
                    }
                }
            }

            $for_vat_after_discount_total = $for_vat_after_discount * $discount_percent / 100;
            $percent_vat_discount = $percent_vat * $discount_percent / 100;
            $no_vat_discount = $no_vat * $discount_percent / 100;
            // dd($discount_percent);
            $all_discount = $for_vat_after_discount_total + $percent_vat_discount + $no_vat_discount;
            // dd($all_discount);
            $net = $for_vat_after_discount + $no_vat + $percent_vat + $service_vat - $all_discount;
            // dd($net);
            $client = Client::find($bill['client_id']);
            $result = $this->saveBill($this->shop_id, $discount, $discount_type, $total_before_vat, $net, $details, $vats, $adds, $sale->store_id, $client, $bill['pay_method'], $sale->id, $bill['payment'], $bill['date_time'], $bill['local_bill_no'], $bill['client_city']?? null);

            if ($result['status']) {
                $value = [
                    'status' => true,
                    'bill_no' => $result['bill_no'],
                    'bill_id' => $result['bill_id'],
                    'message' => 'Save Done successfully'
                ];
            } else {
                $value = [
                    'status' => false,
                    'message' => 'error'
                ];
            }

            array_push($text, $value);
        }
        return $text;
    }

    protected function validateRequest(array $data, null|int $id = null): array
    {
        $allow_lines = BadrShop::select('allow_lines')->where('serial_id', $this->shop_id)->first()->allow_lines ?? 0;
        $roles = [
            'bills'                     => 'required',
            'bills.*.client_id'         => "required|exists:clients,id,shop_id,$this->shop_id",
            'bills.*.date_time'         => 'required|date_format:Y-m-d h:i:s A',
            'bills.*.local_bill_no'     => 'required|numeric',
            'bills.*.sale_details'      => 'required',
            'sale_details.*.quantity'   => 'required|numeric',
            'sale_details.*.item_id'    => "required|exists:items,id,shop_id,$this->shop_id",
            'sale_details.*.unit_id'    => "exists:units,id,shop_id,$this->shop_id",
            'bills.*.pay_method'        => 'required|numeric|in:0,1',
            'bills.*.payment'           => 'required|numeric|min:0',
            'bills.*.discount'          => 'required|numeric|min:0',
            'bills.*.discount_type'     => 'required|numeric|in:0,1',
        ];
        if (auth()->user()->line && $allow_lines)
            $roles['bills.*.client_city'] = $check ? 'required|string' : 'nullable';

        $errors = [];
        $validation = validator()->make($data, $roles);

        if ($validation->fails()) {
            foreach ($validation->errors()->getMessages() as $key => $error) $errors[$key] = $error[0];
        }
        return ['validated' => $validation->validated(), 'errors' => $errors];
    }
}

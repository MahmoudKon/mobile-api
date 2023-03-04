<?php

namespace App\Http\Services;

use App\Models\ClientTransaction;
use Exception;
use Illuminate\Support\Facades\DB;

class InvoiceService
{
    protected int $shop_id;
    protected array $validated_data = [];
    protected array $items_transactions = [];
    protected array $clients_transactions = [];

    public function __construct()
    {
        $this->shop_id = shopId();
    }

    public function handler(array $data = [])
    {
        dd($data);
        try {
            DB::beginTransaction();
                return ['status' => 200, 'data' => $this->calculate($data)];
            DB::commit();
        } catch (Exception $e) {
            return ['status' => 500, 'message' => $e->getMessage()];
        }
    }

    public function calculate($bills)
    {
//         $shop = \DB::table('badr_shop')->where('serial_id', $shop_id)->first();
//         $adds = $shop->bill_adds;
//         $user_sale_point = SalePoint::whereId(auth('rep')->user()->sale_point)->first();
//         $user_store = $user_sale_point->store_id;
//         $sale_point_id = $user_sale_point->id;
//         $text = [];
//         foreach ($bills as $bill) {
//             $no_vat = 0;
//             $for_vat = 0;
//             $details = [];
//             foreach ($bill['sale_details'] as $data) {
//                 $item = Item::select('id', 'vat_state', 'vat_id', 'sale_price', 'pay_price')->find($data['item_id']);
//                 $vat_state = $item->vat_state;
//                 $vat_id = $item->vat_id;
//                 $item_price = $item->sale_price;
//                 $item_quantity = $data['quantity'];
//                 $item_total = $item_price * $item_quantity;
//                 $ready_item = [
//                     'item_id' => $item->id,
//                     'quantity' => $item_quantity,
//                     'price' => $item_price,
//                     'basic_price' => $item->sale_price,
//                     'total' => $item_total,
//                     'pay_price' => $item->pay_price,
//                     'sale_point' => $sale_point_id,
//                     'unit' => $data['unit_id'],
//                     'vat_state' => $item->vat_state
//                 ];
//                 array_push($details, $ready_item);
//                 if ($vat_state == 0) {
//                     $no_vat += $item_total;
//                 }
//                 if ($vat_state == 1) {
//                     $for_vat += $item_total;
//                 }
//                 if ($vat_state == 2) {
//                     if ($adds == 0) {
//                         $vat_value = BillAdd::where([
//                             'shop_id' => $shop_id,
//                             'id' => $vat_id
//                         ])->first()->addition_value;
//                         $n_total = $item_total / (1 + ($vat_value / 100));
//                         $for_vat += $n_total;
//                     } else {
//                         $for_vat += $item_total;
//                     }
//                 }
//             }
//             $total_before_vat = $no_vat + $for_vat;
//             $discount = $bill['discount'];
//             $discount_percent = $bill['discount'];
//             $discount_type = $bill['discount_type'];
//             if ($discount_type == 1) { // money
//                 if ($discount > 0) {
//                     $discount_percent = $discount * 100 / $total_before_vat;  // money to percent
//                 }
//             }
//             $for_vat_after_discount = $for_vat;
//             $percent_vat = 0;
//             $service_vat = 0;
//             $vats = array();
//             if ($adds == 0) {
//                 $bill_add = BillAdd::where('shop_id', $shop_id)->whereIn('add_role', ['0', '1'])->get();
//                 foreach ($bill_add as $add) {
//                     $vat = BillAdd::where([
//                         'shop_id' => $shop_id,
//                         'id' => $add->id
//                     ])->first();
//                     if ($vat->check_addition == 0) {
//                         $vat_value = $vat->addition_value / 100 * $for_vat_after_discount;
//                         $percent_vat += $vat_value;
//                         $vat_value_discount = $vat_value * $discount_percent / 100;
//                         $vat_value_after_discount = $vat_value - $vat_value_discount;
//                         $vats[$vat->id] = $vat_value_after_discount;
//                     } else {
//                         $service_vat += $vat->addition_value;
//                         $vats[$vat->id] = $vat->addition_value;
//                     }
//                 }
//             }
//             $for_vat_after_discount_total = $for_vat_after_discount * $discount_percent / 100;
//             $percent_vat_discount = $percent_vat * $discount_percent / 100;
//             $no_vat_discount = $no_vat * $discount_percent / 100;
//             $all_discount = $for_vat_after_discount_total + $percent_vat_discount + $no_vat_discount;
//             $net = $for_vat_after_discount + $no_vat + $percent_vat + $service_vat - $all_discount;
//             $client = Client::find($bill['client_id']);
//             $result = $this->saveBill($shop_id, $discount, $discount_type, $total_before_vat, $net, $details, $vats, $adds, $user_store, $client, $bill['pay_method'], $sale_point_id, $bill['payment'], $bill['date_time'], $bill['local_bill_no']);
//             if ($result['status']) {
//                 $value = [
//                     'status' => true,
//                     'bill_no' => $result['bill_no'],
//                     'bill_id' => $result['bill_id'],
//                     'message' => 'Save Done successfully'
//                 ];
//             } else {
//                 $value = [
//                     'status' => false,
//                     'message' => 'error'
//                 ];
//             }
//             array_push($text, $value);
//         }
//         return $text;
    }

//     public function saveBill($shop_id, $discount, $discount_type, $total_before_vat, $net, $details, $vats, $adds, $user_store, $client, $pay_method, $sale_point_id, $payment, $bill_date, $local_bill_no)
//     {
//         $transaction = DB::transaction(function () use ($shop_id, $discount, $discount_type, $total_before_vat, $net, $details, $vats, $adds, $user_store, $client, $pay_method, $sale_point_id, $payment, $bill_date, $local_bill_no) {
//             $client_id = $client->id;
//             $store_id = $user_store;
//             $date = Carbon::now();
//             $bill_no = BackProcess::whereShopId($shop_id)->max('bill_no') + 1;
//             $pay_state = $pay_method;
//             $paid = $payment;
//             if ($pay_state == 1) {
//                 $paid = $net;
//             }
//             $back_process = new BackProcess();
//             $back_process->date_process = $date;
//             $back_process->sale_date = $bill_date;
//             $back_process->pay_date = $bill_date;
//             $back_process->add_user = auth('rep')->id();
//             $back_process->client_id = $client_id;
//             $back_process->discount = $discount;
//             $back_process->discount_type = $discount_type;
//             $back_process->pay_stat = $pay_method;
//             $back_process->store = $store_id;
//             $back_process->bill_no = $bill_no;
//             $back_process->local_bill_no = $local_bill_no;
//             $back_process->shop_id = $shop_id;
//             $back_process->total_price = $total_before_vat;
//             $back_process->net_price = $net;
//             $back_process->payment = $paid;
//             $back_process->bil_payment = $paid;
//             $back_process->rest = $net - $paid;
//             $back_process->clientOldBalance = $client->balance;
//             $back_process->save();
//             $bill_id = $back_process->id;
//             $point_id = $sale_point_id;
//             foreach ($details as $index => $detail) {
//                 $back_detail = new BackDetails();
//                 $back_detail->date_back = $bill_date;
//                 $back_detail->client_id = $client_id;
//                 $back_detail->bill_id = 0;
//                 $back_detail->back_id = $bill_id;
//                 $back_detail->items_id = $detail['item_id'];
//                 $back_detail->quantity = $detail['quantity'];
//                 $back_detail->price = $detail['price'];
//                 $back_detail->basic_price = $detail['basic_price'];
//                 $back_detail->sale_point = $detail['sale_point'];;
//                 $back_detail->shop_id = $shop_id;
//                 $back_detail->add_user = auth('rep')->id();
//                 $back_detail->unit = $detail['unit'];
//                 $back_detail->pay_price = $detail['pay_price'];
//                 $back_detail->item_vat_state = $detail['vat_state'];
//                 $back_detail->save();
//                 $item = Item::where([
//                     'shop_id' => $shop_id,
//                     'id' => $detail['item_id']
//                 ])->first();
//                 if ($store_id == 0) {
//                     $old_qty = $item->quantity;
//                     $qty = $detail['quantity'];
//                     $new_qty = $old_qty + $qty;
//                     $item->update([
//                         'quantity' => $new_qty,
//                         'shop_id' => $shop_id,
//                     ]);
//                 } else {
//                     $store = StoreItem::where('item_id', $detail['item_id'])->where('store_id', $store_id)->first();
//                     $old_qty = $store->store_quant;
//                     $qty = $detail['quantity'];
//                     $new_qty = $old_qty + $qty;
//                     $store->update([
//                         'store_quant' => $new_qty,
//                         'shop_id' => $shop_id,
//                     ]);
//                 }
                    // $this->items_transactions [$index] = [
                    //     'tansaction_date' => $date,
                    //     'action_date' => $bill_date,
                    //     'item_id' => $detail['item_id'],
                    //     'type' => 0,
                    //     'price' => $detail['price'],
                    //     'quantity' => $qty,
                    //     'new_quantity' => $new_qty,
                    //     'old_quantity' => $old_qty,
                    //     'remain_quantity' => $new_qty,
                    //     'sale_id' => 0,
                    //     'back_id' => $bill_id,
                    //     'store_id' => $user_store,
                    //     'user_id' => authId(),
                    //     'shop_id' => $this->shop_id
                    // ];
//             }
//             $safe = SalePoint::where('id', $point_id)->first();
//             $old_balance = $client->balance;
//             $add_balance = $net - $paid;


                // $this->clients_transactions [$index] = [
                //     'shop_id' => $this->shop_id,
                //     'client_id' => $client_id,
                //     'user_id' => authId(),
                //     'amount' => $net,
                //     'type' => 0,
                //     'effect' => 0,
                //     'pay_day' => $bill_date,
                //     'date_time' => $date,
                //     'bill_id' => 0,
                //     'sale_back_id' => $bill_id,
                //     'balance' => $old_balance - $add_balance,
                //     'safe_point_id' => $safe->id,
                //     'safe_balance' => $safe->money_point,
                //     'bill_net_total' => $net,
                //     'safe_type' => $safe->point_type,
                // ];

                // if ($pay_state == 1) {
                //     $safe->decrement('money_point', $net);
                //     $this->clients_transactions [$index]['balance'] = $old_balance - $net;
                // } else {
                //     $this->clients_transactions [$index]['amount'] = $paid;
                // }

//             $client->update([
//                 'balance' => $old_balance - $add_balance,
//             ]);
//             if ($adds == '0' && is_array($vats) && sizeof($vats) > 0) {
//                 foreach ($vats as $vat_id => $vat_value) {
//                     $vat = BillAdd::where('id', $vat_id)->first();
//                     $bill_add = new BillAddHistory();
//                     $bill_add->bill_id = $bill_id;
//                     $bill_add->addition_id = $vat_id;
//                     $bill_add->addition_value = $vat_value;
//                     $bill_add->type = 3;
//                     $bill_add->shop_id = $shop_id;
//                     $bill_add->bill_add = $vat->addition_value;
//                     $bill_add->add_type = $vat->check_addition;
//                     $bill_add->save();
//                 }
//             }
//             return [
//                 'status' => true,
//                 'bill_no' => $bill_no,
//                 'bill_id' => $bill_id
//             ];
//         });
//         if ($transaction['status']) {
            // $this->createTransactions();
//             return $transaction;
//         } else {
//             return false;
//         }
//     }

    public function createTransactions()
    {
        ClientTransaction::store($this->clients_transactions);
    }
}

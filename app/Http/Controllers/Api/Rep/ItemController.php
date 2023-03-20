<?php

namespace App\Http\Controllers\Api\Rep;

use App\Http\Controllers\GeneralApiController;
use App\Http\Resources\ItemPricesResource;
use App\Http\Resources\ItemsResource;
use App\Models\Item;
use App\Models\ItemPrice;
use App\Models\ItemUnit;
use App\Models\SalePoint;
use App\Models\Unit;
use Illuminate\Support\Facades\DB;

class ItemController extends GeneralApiController
{
    public function __construct()
    {
        parent::__construct(Item::class, ItemsResource::class);
    }

    public function items2()
    {
        $rows = $this->query()->get();
        return $this->returnData($this->resource::collection($rows));
    }

    public function itemsPrices()
    {
        $rows = ItemPrice::select('id', 'shop_id', 'price', 'list_quant', 'item_id', 'list_id')->with('item', 'list')->get();
        return $this->returnData(ItemPricesResource::collection($rows));
    }

    public function getArrayUnits($row, $shop_id)
    {
        $qtyOriginal = (float)$row->quantity;
        $qty         =  $qtyOriginal ;
        $row_units   = ItemUnit::where('shop_id', $shop_id)->where('item_id', $row->id)->get();

        $units_arr = array([
            'unit_id'    => $row->unit_id,
            'price'      => $row->sale_price,
            'unit_value' => (float)1,
            'quantity'   => (float)$qtyOriginal
        ]);
        
        foreach ($row_units as $unit) {            
            $n_qty = (float)($qtyOriginal / (float) ($unit->unit_value > 0 ? $unit->unit_value : 1));
                        
            if ($n_qty < $qtyOriginal) {
                $qty = $n_qty;
            }

            $qty = floor($qty);

            $new_arr = array([
                'unit_id'    => $unit->unit_id,
                'price'      => $unit->unit_price,
                'unit_value' => (float)$unit->unit_value,
                'quantity'   => $qty,
            ]);

            $units_arr = array_merge($units_arr, $new_arr);
        }

        $vs_query_ = DB::table('bills_add')->where('shop_id', $shop_id);

        $vs = $vs_query_->get();

        $new_arr_units = [];

        foreach ($units_arr as $unit) {
            $basic_price = $unit['price'];
            $sale_price = $basic_price;
            $dis = 0.00;

            if ($row->withDiscount == 0) {
                $new_price = $sale_price;
                $unit['sale_price'] = $sale_price;
                $unit['new_price']  = $sale_price;
            } else {
                $percent = $row->discount_percent;
                $unit['sale_price'] = $sale_price;

                $new_price = $sale_price - ($sale_price * $percent / 100);
                $unit['new_price'] = $new_price;

                $basic_price = $new_price;
                $dis = $percent;
            }

            $vat = 0.00;

            if ($row->vat_state == 2) {
                $v_ = $vs_query_->where('id', $row->vat_id)->first();

                if ($v_) {
                    $unit['vat_name'] = $v_->Addition_name;
                    $basic_price = $unit['new_price'] / (1 + ($v_->addition_value / 100));
                } else {
                    $unit['vat_name'] = "";
                }
            } else {
                $unit['vat_name'] = "";
            }

            if ($row->vat_state != '0') {
                foreach ($vs as $vc) {
                    $type = $vc->check_addition;
                    $val  = $vc->addition_value;
                    if ($type) {
                        $vat += $val;
                    } else {
                        $vat += $basic_price * $val / 100;
                    }
                }
            }

            $unit['discount'] = $dis;
            $unit['basic_price'] = $basic_price;
            $unit['vat'] = $vat;
            $unit['unit_name'] = Unit::where('shop_id', $shop_id)->where('id', $unit['unit_id'])->first()->name ?? "";

            array_push($new_arr_units, $unit);
        }

        return $new_arr_units;
    }


    public function query(?int $id = null): \Illuminate\Database\Eloquent\Builder
    {
        $store_id = SalePoint::select('store_id')->find($this->sale_point)->store_id;
        return $this->model::query()->select('id', 'item_name', 'img', 'sale_unit', 'unit_id', 'sale_price', 'lowest_price', 'pay_price', 'barcode', 'vat_state', 'vat_id')
                    ->with('type', 'addition', 'additions', 'unit', 'stores', 'units')->where('available', true)
                    ->when($id, fn($q) => $q->where('id', $id))
                    ->whereHas('stores', fn($q) => $q->where('store_id', $store_id));
    }
}


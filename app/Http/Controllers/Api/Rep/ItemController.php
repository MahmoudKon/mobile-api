<?php

namespace App\Http\Controllers\Api\Rep;

use App\Http\Controllers\BasicApiController;
use App\Http\Controllers\Controller;
use App\Http\Resources\ItemsResource;
use App\Models\Item;
use App\Models\SalePoint;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ItemController extends BasicApiController
{
    public function index()
    {
        $store_id = SalePoint::select('store_id')->find($this->sale_point)->store_id;
        $rows = Item::select('id', 'item_name', 'img', 'sale_unit', 'unit_id', 'sale_price', 'lowest_price', 'pay_price', 'barcode', 'vat_state', 'vat_id')
                        ->with('type', 'unit', 'stores')->where('available', true)
                        ->whereHas('stores', function ($query) use($store_id) {
                            $query->where('store_id', $store_id);
                        })->get();
        return $this->returnData( ItemsResource::collection($rows) );
    }
}

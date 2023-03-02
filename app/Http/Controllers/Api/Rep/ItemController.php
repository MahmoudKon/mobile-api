<?php

namespace App\Http\Controllers\Api\Rep;

use App\Http\Controllers\GeneralApiController;
use App\Http\Resources\ItemPricesResource;
use App\Http\Resources\ItemsResource;
use App\Models\Item;
use App\Models\ItemPrice;
use App\Models\SalePoint;

class ItemController extends GeneralApiController
{
    public function __construct()
    {
        parent::__construct(Item::class, ItemsResource::class);
    }

    public function items2()
    {
        $rows = $this->query()->get();
        return $rows->count()
            ? $this->sendResponse(result: ['data' => $this->resource::collection($rows)])
            : $this->sendError('no data found');
    }

    public function itemsPrices()
    {
        $rows = ItemPrice::query()->select('id', 'shop_id', 'price', 'list_quant', 'item_id', 'list_id')->with('item', 'list')->get();
        return $this->returnData(ItemPricesResource::collection($rows));
    }


    public function query(?int $id = null): \Illuminate\Database\Eloquent\Builder
    {
        $store_id = SalePoint::select('store_id')->find($this->sale_point)->store_id;
        return $this->model::query()->select('id', 'item_name', 'img', 'sale_unit', 'unit_id', 'sale_price', 'lowest_price', 'pay_price', 'barcode', 'vat_state', 'vat_id')
            ->with('type', 'unit', 'stores')->where('available', true)
            ->when($id, fn($q) => $q->where('id', $id))
            ->whereHas('stores', fn($q) => $q->where('store_id', $store_id));
    }
}


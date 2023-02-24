<?php

namespace App\Http\Controllers\Api\Rep;

use App\Http\Controllers\BasicApiController;
use App\Http\Resources\ItemPricesResource;
use App\Http\Resources\ItemTypesResource;
use App\Http\Resources\SettingsResource;
use App\Models\Badrshop;
use App\Models\City;
use App\Models\ItemPrice;
use App\Models\ItemType;
use App\Models\PriceList;
use Illuminate\Http\Request;

class GeneralListController extends BasicApiController
{
    public function settings()
    {
        $setting = Badrshop::select('multi_price', 'select_client', 'sale_cash', 'tracking', 'make_bill as bill_in_location',
            'logo_path' ,'company_ratio','sale_details' ,'bill_adds' , 'sale_details', 'allow_lines')->first();
        return $this->sendResponse(result: ['data' => new SettingsResource($setting)]);
    }

    public function prices()
    {
        $rows = PriceList::select('id', 'list_name as name')->get()->toArray();
        return $this->returnData($rows);
    }

    public function itemTypes()
    {
        $rows = ItemType::select('id', 'name', 'upload_img')->get();
        return $this->returnData(ItemTypesResource::collection($rows));
    }

    public function cities()
    {
        $rows = City::select('id', 'city_name as name')->get()->toArray();
        return $this->returnData($rows);
    }

    public function itemsPrices()
    {
        $rows = ItemPrice::query()->select('id', 'shop_id', 'price', 'list_quant', 'item_id', 'list_id')->with('item', 'list')->get();
        return $this->returnData(ItemPricesResource::collection($rows));
    }
}

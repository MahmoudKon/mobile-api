<?php

namespace App\Http\Controllers\Api\Rep;

use App\Http\Controllers\BasicApiController;
use App\Http\Resources\ClientsResource;
use App\Http\Resources\SettingsResource;
use App\Models\Badrshop;
use App\Models\City;
use App\Models\ClientsGroup;
use App\Models\PriceList;
use App\Models\SalePoint;

class GeneralListController extends BasicApiController
{
    public function settings()
    {
        $setting = Badrshop::select('multi_price', 'select_client', 'sale_cash', 'tracking', 'make_bill', 'logo_path' ,'company_ratio','sale_details' ,'bill_adds' , 'sale_details', 'allow_lines')->first();
        return $this->sendResponse(result: ['data' => new SettingsResource($setting)]);
    }

    public function prices()
    {
        $rows = PriceList::select('id', 'list_name')->get()->toArray();
        return $this->returnData($rows);
    }
    public function cities()
    {
        $rows = City::select('id', 'city_name as name')->get()->toArray();
        return $this->returnData($rows);
    }

    public function salePoints()
    {
        $rows = SalePoint::query()->select('id', 'point_name as name')->get()->toArray();
        return $this->returnData($rows);
    }

    public function clientsGroups()
    {
        $groups = ClientsGroup::select('id', 'name', 'group_discount')->when(auth()->user()->clients_group != 0, function ($query) {
                                    $query->where('id', auth()->user()->clients_group);
                                })->get()->toArray();
        $clients = (new ClientController)->query()->get();
        $response = ['groups' => $groups, 'clients' => ClientsResource::collection($clients)];
        return $this->sendResponse(result: $response);
    }
}

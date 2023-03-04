<?php

namespace App\Http\Controllers\Api\Rep;

use App\Http\Controllers\BasicApiController;
use App\Http\Requests\Api\ListClientLineRequest;
use App\Models\Line;
use Illuminate\Support\Facades\DB;

class LineController extends BasicApiController
{
    public function clients(ListClientLineRequest $request)
    {
        $unit = 6378.10;
        $lat  = $request->lat;
        $lon  = $request->lon;

        $clients = Line::leftJoin('line_clients', 'lines.id', '=', 'line_clients.line_id')
                    ->leftJoin('clients', 'clients.id', '=', 'line_clients.client_id')
                    ->leftJoin('google_cities', 'clients.city_id', '=', 'google_cities.id')
                    ->leftJoin('exceptional_visitation', function ($q) {
                        $q->on('exceptional_visitation.line_id', '=', 'lines.id');
                        $q->on('exceptional_visitation.client_id', '=', 'line_clients.client_id');
                    })
                    ->Where(function ($q) {
                        $q->where('lines.representative_id',  authId());
                        $q->where('line_clients.shop_id', shopId());
                        $q->Where(function($q){
                            $q->where("line_clients." . $this->getCurrentDay(), 1);
                            $q->orWhere(DB::raw('LOWER(SUBSTRING(DAYNAME(exceptional_visitation.date), 1, 3))'), $this->getCurrentDay());
                        });
                    })
                    ->select(
                        DB::raw("
                                    clients.id , clients.lat, clients.lon, clients.balance,
                                    google_cities.city_name_ar, clients.tele AS telephone, clients.client_name,
                                    line_clients.sat, line_clients.sun, line_clients.mon,
                                    line_clients.tue, line_clients.wed, line_clients.thu,
                                    line_clients.fri,
                                    truncate( ($unit * ACOS(COS(RADIANS(" . $lat . "))
                                    * COS(RADIANS(clients.lat))
                                    * COS(RADIANS(" . $lon . ") - RADIANS(clients.lon))
                                    + SIN(RADIANS(" . $lat . "))
                                    * SIN(RADIANS(clients.lat)))) , 2) as distance
                                ")
                    )
                    ->orderBy(DB::raw("
                                truncate( ($unit * ACOS(COS(RADIANS(" . $lat . "))
                                * COS(RADIANS(clients.lat))
                                * COS(RADIANS(" . $lon . ") - RADIANS(clients.lon))
                                + SIN(RADIANS(" . $lat . "))
                                * SIN(RADIANS(clients.lat)))) , 2)   
                            "), 'asc')
                    ->get();
        
        $cities = $clients->pluck('city_name_ar')->unique()->filter(function ($value, $key) {
                                return $value != null;
                            })->values()->all();

        return $this->sendResponse(result: ['data' => $clients, 'cities' => $cities]);
    }
    
    private function getCurrentDay()
    {
        return strtolower(date('D', strtotime(date('y-m-d'))));
    }
}

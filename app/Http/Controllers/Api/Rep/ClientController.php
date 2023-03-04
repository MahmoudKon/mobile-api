<?php

namespace App\Http\Controllers\Api\Rep;

use App\Http\Controllers\GeneralApiController;
use App\Http\Requests\Api\ClientRequest;
use App\Http\Resources\ClientsResource;
use App\Http\Services\ClientService;
use App\Models\Badrshop;
use App\Models\Client;
use App\Models\ClientsGroup;

class ClientController extends GeneralApiController
{
    public function __construct()
    {
        parent::__construct(Client::class, ClientsResource::class);
    }

    public function clientsGroups()
    {
        $groups = ClientsGroup::select('id', 'name', 'group_discount')->when(authUser()->clients_group != 0, function ($query) {
                                    $query->where('id', authUser()->clients_group);
                                })->get()->toArray();
        $clients = (new ClientController)->query()->get();
        $response = ['groups' => $groups, 'clients' => ClientsResource::collection($clients)];
        return $this->sendResponse(result: $response);
    }

    public function store(ClientRequest $request)
    {
        $allow_lines = Badrshop::select('allow_lines')->where('serial_id', shopId())->first()->allow_lines;
        if ($allow_lines && ! authUser()->line) return $this->sendError('لا يمكن اضافة عميل لعدم وجود خط');
        $validated_data = array_merge($request->validated(), ['check_to_create_line' => $allow_lines && ! authUser()->line]);
        $row = new ClientService($validated_data);

        return $row->client
            ? $this->sendResponse('Client created successfully', ['data' => new $this->resource($row->client)])
            : $this->sendError('Error try again');
    }

    public function update(ClientRequest $request, $id)
    {
        $row = $this->model::find($id);
        if (!$row) return $this->sendError('This client not exists');
        $row->update($request->validated());
        return $this->sendResponse('Client updated successfully', ['data' => new $this->resource($row)]);
    }

    public function query(?int $id = null): \Illuminate\Database\Eloquent\Builder
    {
        return $this->model::query()->selectRaw('id, client_name, tele, client_tax_number, shop_id, address, group_id, FORMAT(balance, 2) as balance, lat, lon, price_list_id')
                            ->when($id, fn($q) => $q->where('id', $id))
                            ->when(authUser()->clients_group, function ($query) {
                                $query->where('group_id', authUser()->clients_group);
                            });
    }























//try{
//    $transaction = DB::transaction(function () use ($request, $shop_id, &$client) {
//    $row = Client::create([
//        'shop_id'           => $shop_id,
//        'client_name'       => $request->client_name,
//        'balance'           => $request->balance,
//        'tele'              => $request->tele,
//        'mobile1'           => $request->tele,
//        'address'           => $request->address,
//        'lat'               => $request->lat,
//        'lon'               => $request->lon,
//        'city_id'           => $request->city_id ?? 0,
//        'add_user'          => auth('rep')->id(),
//        'add_date'          => Carbon::now(),
//        'client_tax_number' => $request->client_tax_number,
//        'group_id'          => auth()->guard('rep')->user()->clients_group
//    ]);
//
//    ClientTransaction::create([
//        'date_time' => Carbon::now(),
//        'client_id' => $row->id,
//        'amount'    => $row->balance,
//        'type'      => 4,
//        'pay_day'   => Carbon::now(),
//        'balance'   => $request->balance ?? 0,
//        'user_id'   => auth('rep')->id(),
//        'shop_id'   => $shop_id
//    ]);
//
//    $client = Client::selectRaw('id, client_name as name, tele as telephone, client_tax_number , shop_id, address,
//                                 group_id, FORMAT(balance, 2) as balance, lat, lon, price_list_id as list_id')
//        ->where(['shop_id' => $shop_id, 'id' => $row->id])
//        ->first();
//
//        return ['status' => true, 'data' => $client, 'message' => 'Save Done successfully'];
//    });
//    }
//    catch (\Throwable $th) {
//    {
//    $response = ['status' => false, 'message' => ' حدث خطأ ما '];
//    return response()->json($response);
//    }






}

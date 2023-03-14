<?php

namespace App\Http\Controllers\Api\Rep;

use App\Exports\ClientBalanceExport;
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
        return $this->returnData(['groups' => $groups, 'clients' => ClientsResource::collection($clients)]);
    }

    public function store(ClientRequest $request)
    {
        $allow_lines = Badrshop::select('allow_lines')->where('serial_id', shopId())->first()->allow_lines;
        if ($allow_lines && ! authUser()->line) return $this->sendError('لا يمكن اضافة عميل لعدم وجود خط');
        $validated_data = array_merge($request->validated(), ['check_to_create_line' => $allow_lines && ! authUser()->line]);
        $row = new ClientService($validated_data);

        return $row->client
            ? $this->sendResponse('Client created successfully', ['client' => new $this->resource($row->client)])
            : $this->sendError('Error try again');
    }

    public function update(ClientRequest $request, $id)
    {
        $row = $this->model::find($id);
        if (!$row) return $this->sendError('This client not exists');
        $row->update($request->validated());
        return $this->sendResponse('Client updated successfully', ['client' => new $this->resource($row)]);
    }

    public function balanceSheetExcel($client_id)
    {
        $client = Client::select('id', 'client_name as name', 'shop_id')->find($client_id);

        if (! $client)
            return $this->sendError('This client not found!');

        ini_set('max_execution_time', 0);
        ini_set('max_input_time', 0);
        ini_set('memory_limit', '256M');

        $file_name = time()."-$client->name.xlsx";
        \Excel::store(new ClientBalanceExport($client), $file_name);

        return $this->sendResponse(result: ['file' => $file_name]);
    }

    public function query(?int $id = null): \Illuminate\Database\Eloquent\Builder
    {
        return $this->model::query()->selectRaw('id, client_name, tele, client_tax_number, shop_id, address, group_id, FORMAT(balance, 2) as balance, lat, lon, price_list_id')
                            ->when($id, fn($q) => $q->where('id', $id))
                            ->when(authUser()->clients_group, function ($query) {
                                $query->where('group_id', authUser()->clients_group);
                            });
    }
}

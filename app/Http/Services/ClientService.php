<?php

namespace App\Http\Services;

use App\Models\Client;
use App\Models\ClientTransaction;
use App\Models\LineCity;
use App\Models\LineClient;
use Illuminate\Support\Facades\DB;

class ClientService
{
    protected Client $client;

    public function __construct(protected array $validated)
    {
        $this->create();
        return $this->client;
    }

    public function create()
    {
        DB::beginTransaction();
            $this->createClient()->createTransaction()->createLine();
        DB::commit();
        return $this;
    }

    protected function createClient()
    {
        $this->client = Client::create( array_merge($this->validated, [
                'city_id'           => 0,
                'StorePass'         => 'empty',
                'shop_id'           => shopId(),
                'add_user'          => auth()->id(),
                'edit_user'         => auth()->id(),
                'price_list_id'     => auth()->id(),
                'add_date'          => now(),
                'group_id'          => auth()->user()->clients_group
            ]));

        return $this;
    }

    protected function createTransaction()
    {
        $this->transaction = ClientTransaction::create([
                'date_time' => now(),
                'pay_day'   => now(),
                'type'      => 4,
                'client_id' => $this->client->id,
                'amount'    => $this->client->balance,
                'balance'   => $this->client->balance,
                'user_id'   => $this->client->add_user,
                'shop_id'   => $this->client->shop_id
            ]);

        return $this;
    }

    protected function createLine()
    {
        if ( !$this->validated['check_to_create_line'] ) return $this;
        $data = ['line_id'   => auth()->user()->line->id, 'client_id' => $this->client->id];

        if (request()->has('days')) {
            foreach (request()->days as $day) $data[$day] = true;
        }

        LineClient::create($data);
        return $this;
    }
}

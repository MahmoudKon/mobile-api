<?php

namespace App\Http\Services;

use App\Models\Client;
use App\Models\ClientTransaction;
use App\Models\LineClient;
use Illuminate\Support\Facades\DB;

class ClientService
{
    public Client $client;
    public array $transaction;

    public function __construct(protected array $validated)
    {
        return $this->create();
    }

    public function create()
    {
        DB::beginTransaction();
            $this->createClient()->createTransaction()->createLine();
        DB::commit();
        return $this->client;
    }

    protected function createClient()
    {
        $this->client = Client::create( array_merge($this->validated, [
                'city_id'           => 0,
                'StorePass'         => 'empty',
                'shop_id'           => shopId(),
                'add_user'          => authId(),
                'edit_user'         => authId(),
                'price_list_id'     => authId(),
                'add_date'          => now(),
                'group_id'          => authUser()->clients_group,
                'api_token'         => ' ',
            ]));

        return $this;
    }

    protected function createTransaction()
    {
        $this->transaction = ClientTransaction::create([
                'date_time'     => now(),
                'pay_day'       => now(),
                'type'          => 4,
                'client_id'     => $this->client->id,
                'amount'        => $this->client->balance,
                'balance'       => $this->client->balance,
                'user_id'       => $this->client->add_user,
                'bill_id'       => 0,
                'sale_back_id'  => 0,
                'supplier_id'   => 0,
                'problem_id'    => 0,
                'effect'        => 0,
                'salary_month'  => 0,
                'OutTransactionID'=> 0,
                'spend_id'      => 0,
            ]);

        return $this;
    }

    protected function createLine()
    {
        if ( !$this->validated['check_to_create_line'] ) return $this;
        $data = ['line_id'   => authUser()->line->id, 'client_id' => $this->client->id];

        if (request()->has('days')) {
            foreach (request()->days as $day) $data[$day] = true;
        }

        LineClient::create($data);
        return $this;
    }
}

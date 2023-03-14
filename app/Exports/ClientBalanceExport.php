<?php

namespace App\Exports;

use App\Models\Client;
use App\Models\ClientTransaction;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;

class ClientBalanceExport implements FromView
{
    public function __construct(public Client $client)
    {
        //
    }

    /**
    * @return \Illuminate\Support\Collection
    */
    public function view(): View
    {
        return view('exports.client_balance', [
            'transactions' => $this->getQuery()
        ]);
    }

    protected function getQuery()
    {
        $transactions = ClientTransaction::select('id', 'pay_day', 'balance', 'type', 'installment_id', 'bill_id', 'bill_net_total', 'amount')
                                ->where('client_id', $this->client->id)
                                ->whereIn('type', [0, 1, 2, 4, 8, 9])
                                ->where(function($query) {
                                    $query->whereNull('is_deleted')->orWhere('is_deleted', false);
                                })
                                ->with('invoice:id,bill_no')->get();

        return prepareTransactions($transactions);
    }
}

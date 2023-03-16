<?php

namespace App\Exports;

use App\Models\Client;
use App\Models\ClientTransaction;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;

class ClientBalanceExport implements FromView
{
    private $from;
    private $to;

    public function __construct(public Client $client, public array $data)
    {
        $this->from = $data['from'] ?? null;
        $this->to   = $data['to'] ?? null;
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
                                ->when($this->from, function($query) {
                                    $query->where('pay_day', '>=', $this->from);
                                })
                                ->when($this->to, function($query) {
                                    $query->where('pay_day', '<=', $this->to);
                                })
                                ->with('invoice:id,bill_no')->orderBy('pay_day', 'DESC')->get();

        return prepareTransactions($transactions);
    }
}

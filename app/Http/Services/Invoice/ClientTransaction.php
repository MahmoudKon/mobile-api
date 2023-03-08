<?php

namespace App\Http\Services\Invoice;

use App\Models\Client;
use App\Models\Invoice;
use App\Models\SalePoint;
use \App\Models\ClientTransaction as ModelClientTransaction;

class ClientTransaction
{
    public Client $client;
    public ModelClientTransaction $transaction;

    public Invoice $invoice;
    public SalePoint $salePoint;

    public function setInvoice(Invoice $invoice)
    {
        $this->invoice = $invoice;
        return $this;
    }

    public function setClient(Client $client)
    {
        $this->client = $client;
        return $this;
    }

    public function setSalePoint(SalePoint $salePoint)
    {
        $this->salePoint = $salePoint;
        return $this;
    }

    public function incrementBalance(float $amount = 0.00)
    {
        $this->client->increment('balance', $amount);
        return $this;
    }

    public function decrementBalance(float $amount = 0.00)
    {
        $this->client->decrement('balance', $amount);
        return $this;
    }

    public function setTransaction()
    {
        $this->transaction = [
            'shop_id' => shopId(),
            'user_id' => authId(),
            'date_time' => day_now(2),
            'amount' => $this->salePoint->money_point,
            'safe_point_id' => $this->salePoint->getSafePoint()->id,
            'safe_balance' => $this->salePoint->getSafePoint()->money_point,
            'pay_day' => $this->invoice->invoice_date,
            'bill_net_total' => $this->invoice->net_price,
            'notes' => $this->invoice->notes,
            'bill_id' => $this->invoice->id,
            'balance' => $this->client->balance,
            'client_id' => $this->client->id,
        ];
    }
}

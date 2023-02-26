<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ClientReceiptResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param \Illuminate\Http\Request $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'client_name' => $this->client->name,
            'amount' => $this->amount,
            'pay_day' => $this->pay_day,
            'balance' => $this->balance,
            'bill_id' => $this->bill_id,
            'date_time' => $this->date_time,
            'net_price' => $this->invoice->net_price,
            'notes' => $this->notes,
        ];
    }
}

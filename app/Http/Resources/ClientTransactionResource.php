<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ClientTransactionResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'id'                => $this->id,
            'date'              => $this->pay_day,
            'bill_no'           => $this->invoice->bill_no,
            'expense'           => $this->effect == 0 ? $this->amount : '',
            'income'            => $this->effect == 1 ? $this->amount : '',
            'remaining_balance' => $this->safe_balance,
            'user_name'         => $this->user->user_name ?? '',
            'client_name'       => $this->client->name ?? '',
            'details'           => getTypeName($this->type),
        ];
    }
}

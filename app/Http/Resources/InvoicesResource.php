<?php

namespace App\Http\Resources;

use Carbon\Carbon;
use Illuminate\Http\Resources\Json\JsonResource;

class InvoicesResource extends JsonResource
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
            'id'            => $this->id,
            'bill_no'       => $this->bill_no,
            'client'        => $this->client->name,
            'date'          => Carbon::parse($this->invoice_date)->toDateString(),
            'time'          => Carbon::parse($this->invoice_date)->toTimeString(),
            'items_count'   => $this->details_count,
            'net_price'     => $this->net_price,
            'local_bill_no' => $this->local_bill_no,
        ];
    }
}

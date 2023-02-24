<?php

namespace App\Http\Resources;

use Carbon\Carbon;
use Illuminate\Http\Resources\Json\JsonResource;

class SaleBackInvoiceResource extends JsonResource
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
            'date'          => Carbon::parse($this->sale_date)->format('Y-m-d'),
            'time'          => Carbon::parse($this->sale_date)->format('h:i:s'),
            'net_price'     => $this->net_price,
            'local_bill_no' => $this->local_bill_no,
            'client_name'   => $this->client->client_name,
            'items_number'  => $this->saleBack_count,
        ];
    }
}

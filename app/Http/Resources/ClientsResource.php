<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ClientsResource extends JsonResource
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
            'id'        => $this->id,
            'name'      => $this->client_name,
            'telephone' => $this->tele,
            'client_tax_number' => $this->client_tax_number,
            'address' => $this->address,
            'group_id' => $this->group_id,
            'balance' => $this->balance,
            'lat' => $this->lat,
            'lon' => $this->lon,
            'list_id' => $this->price_list_id,
            'price' => $this->price ?? 0,
        ];
    }
}

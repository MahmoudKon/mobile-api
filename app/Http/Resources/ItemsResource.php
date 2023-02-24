<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ItemsResource extends JsonResource
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
            'id'           => $this->id,
            'name'         => $this->item_name,
            'image'        => $this->img,
            'type'         => $this->type->name,
            'unit'         => $this->unit->name,
            'sale_price'   => $this->sale_price,
            'lowest_price' => $this->lowest_price,
            'pay_price'    => $this->pay_price,
            'barcode'      => $this->barcode,
            'barcode'      => $this->barcode,
            'store'        => $this->stores->first()->name,
            'quantity'     => $this->stores->first()->pivot->store_quant,
        ];
    }
}

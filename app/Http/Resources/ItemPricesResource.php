<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ItemPricesResource extends JsonResource
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
            'id'         => $this->id,
            'item'       => $this->item->name,
            'list'       => $this->list->name,
            'price'      => number_format($this->price, 2),
            'list_quant' => number_format($this->list_quant, 2),
        ];
    }
}

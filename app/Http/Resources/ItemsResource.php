<?php

namespace App\Http\Resources;

use App\Http\Controllers\Api\Rep\ItemController;
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
            'id'                    => $this->id,
            'name'                  => $this->item_name,
            'img'                   => $this->img,
            'image'                 => $this->img,
            'category_name'         => $this->type->name,
            'category_id'           => $this->sale_unit,
            'primary_unit_name'     => $this->unit->name,
            'primary_unit_id'       => $this->unit_id,
            'sale_price'            => $this->getPriceWithoutVat(),
            'lowest_price'          => $this->lowest_price,
            'pay_price'             => $this->pay_price,
            'barcode'               => $this->barcode,
            'vat_state'             => $this->vat_state,
            'vat_id'                => $this->vat_id,
            'vat'                   => $this->addition->addition_value ?? 0,
            'price_without_vat'     => $this->sale_price - $this->addition?->addition_value,
            'store'                 => $this->stores->first()->name,
            'quantity'              => $this->stores->first()->pivot->store_quant,
            'arr_units'             => (new ItemController)->getArrayUnits($this, shopId())
        ];
    }
}

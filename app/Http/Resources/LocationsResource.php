<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class LocationsResource extends JsonResource
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
            'lat'       => $this->lat,
            'lon'       => $this->lon,
            'date_time' => $this->time,
            'shop_id'   => $this->shop_id,
            'user'      => $this->user->name,
        ];
    }
}

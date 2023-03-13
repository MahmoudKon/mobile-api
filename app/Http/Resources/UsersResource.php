<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UsersResource extends JsonResource
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
            "id" => $this->id,
            "token" => $this->token ?? '',
            "name" => $this->name,
            "user_name" => $this->user_name,
            "shop_id" => $this->shop_id,
            "shop_name" => $this->shop->shop_name ?? '',
            "show_clients" => (bool) $this->show_clients,
            "price_decimal" => $this->shop->decimal_num_price,
            "quantity_decimal" => $this->shop->decimal_num_quant,
            "subscription_end_date" => $this->run_date,
            "sale_point_id" => $this->sale_point,
            "sale_minus" => $this->shop->sale_details,
            "currency" => $this->shop->currency,
            "show_pay_price" => $this->show_pay_price,
            "can_edit_client_days" => $this->can_edit_client_days,
            "store_name" => $this->salePoint->store->name,
            "player_id" => $this->player_id,
            'allow_lines' => $this->shop->allow_lines,
        ];
    }
}

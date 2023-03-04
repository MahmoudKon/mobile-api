<?php

namespace App\Http\Resources;

use App\Models\SalePoint;
use Illuminate\Http\Resources\Json\JsonResource;

class SettingsResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        $sale = SalePoint::select('money_point', 'store_id')->with('store')->whereId(salePointId())->first();
        return [
            'multi_price'          => $this->multi_price,
            'select_client'        => $this->select_client,
            'check_lowest_price'   => $this->check_lowest_price,
            'tracking'             => $this->tracking,
            'bill_in_location'     => $this->make_bill,
            'logo'                 => $this->logo_path,
            'company_ratio'        => $this->company_ratio,
            'sale_details'         => $this->sale_details,
            'bill_adds'            => $this->bill_adds,
            'allow_lines'          => $this->allow_lines,
            'point_balance'        => $sale?->money_point,
            'store_name'           => $sale?->store?->name,
            'can_edit_client_days' => authUser()->can_edit_client_days ?? 0,
            'show_pay_price'       => authUser()->show_pay_price ?? 0,
            'sale_cash'            => authUser()->sale_cash ?? 0,
            'sale_discount'        => authUser()->sale_discount ?? 0,
        ];
    }
}

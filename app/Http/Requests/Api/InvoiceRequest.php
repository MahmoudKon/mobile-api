<?php

namespace App\Http\Requests\Api;

use App\Traits\HandleValidationError;
use Illuminate\Foundation\Http\FormRequest;

class InvoiceRequest extends FormRequest
{
    use HandleValidationError;

    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */

    public function rules()
    {
        return [
            'bills'                           => 'required|array|min:1',
            'bills.*.sale_point'              => "required|exists:sale_points,id,shop_id,".shopId(),
            'bills.*.client_id'               => "required|exists:clients,id,shop_id,".shopId(),
            'bills.*.date'                    => 'required|date_format:Y-m-d',
            'bills.*.date_time'               => 'required|date_format:Y-m-d h:i:s A',
            'bills.*.local_bill_no'           => 'required|numeric',
            'bills.*.sale_details'            => 'required|array|min:1',
            'bills.*.sale_details.*.price'    => 'required|numeric|min:1',
            'bills.*.sale_details.*.quantity' => 'required|numeric|min:1',
            'bills.*.sale_details.*.item_id'  => "required|exists:items,id,shop_id,".shopId(),
            'bills.*.sale_details.*.unit_id'  => "required|exists:units,id,shop_id,".shopId(),
            'bills.*.sale_details.*.unitValue'=> "required|numeric",
            'bills.*.discount_type'           => 'required|numeric|in:0,1',
            'bills.*.discountCashValue'       => 'required|numeric|min:0',
            'bills.*.discount'                => 'required|numeric|min:0',
            'bills.*.pay_method'              => 'required|numeric|in:0,1',
            'bills.*.payment'                 => 'required|numeric|min:0',
            'bills.*.total'                   => 'required|numeric|min:0',
            'bills.*.net'                     => 'required|numeric|min:0',
        ];
    }

    public function single_rules()
    {
        return [
            'sale_point'              => "required|exists:sale_points,id,shop_id,".shopId(),
            'client_id'               => "required|exists:clients,id,shop_id,".shopId(),
            'date'                    => 'required|date_format:Y-m-d',
            'date_time'               => 'required|date_format:Y-m-d h:i:s A',
            'local_bill_no'           => 'required|numeric',
            'sale_details'            => 'required|array|min:1',
            'sale_details.*.price'    => 'required|numeric|min:1',
            'sale_details.*.quantity' => 'required|numeric|min:1',
            'sale_details.*.item_id'  => "required|exists:items,id,shop_id,".shopId(),
            'sale_details.*.unit_id'  => "required|exists:units,id,shop_id,".shopId(),
            'sale_details.*.unitValue'=> "required|numeric",
            'discount_type'           => 'required|numeric|in:0,1',
            'discountCashValue'       => 'required|numeric|min:0',
            'discount'                => 'required|numeric|min:0',
            'pay_method'              => 'required|numeric|in:0,1',
            'payment'                 => 'required|numeric|min:0',
            'total'                   => 'required|numeric|min:0',
            'net'                     => 'required|numeric|min:0',
        ];
    }
}

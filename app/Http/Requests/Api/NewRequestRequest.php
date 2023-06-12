<?php

namespace App\Http\Requests\Api;

use Illuminate\Foundation\Http\FormRequest;

class NewRequestRequest extends FormRequest
{
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
            'requests.*.date'            => 'required|date_format:Y-m-d',
            'requests.*.date_time'       => 'required|date',
            'requests.*.store_id'        => 'required|exists:stores,id,shop_id,'.shopId(),
            'requests.*.client_id'       => 'required|exists:clients,id,shop_id,'.shopId(),
            'requests.*.receipt_number'  => 'required|numeric',
            'requests.*.notes'           => 'nullable|string',
            'requests.*.items'           => 'required|array|min:1',
            'requests.*.items.*.item_id'   => 'required|exists:items,id,shop_id,'.shopId(),
            'requests.*.items.*.quantity'  => 'required|numeric|min:0',
            'requests.*.items.*.water'     => 'required|numeric|between:0,100',
            'requests.*.items.*.protein'   => 'required|numeric|between:0,100',
            'requests.*.items.*.fats'      => 'required|numeric|between:0,100',
        ];
    }

    public function single_rules()
    {
        return [
            'date'            => 'required|date_format:Y-m-d',
            'date_time'       => 'required|date',
            'store_id'        => 'required|exists:stores,id,shop_id,'.shopId(),
            'client_id'       => 'required|exists:clients,id,shop_id,'.shopId(),
            'receipt_number'  => 'required|numeric',
            'notes'           => 'nullable|string',
            'items'           => 'required|array|min:1',
            'items.*.item_id'   => 'required|exists:items,id,shop_id,'.shopId(),
            'items.*.quantity'  => 'required|numeric|min:0',
            'items.*.water'     => 'required|numeric|between:0,100',
            'items.*.protein'   => 'required|numeric|between:0,100',
            'items.*.fats'      => 'required|numeric|between:0,100',
        ];
    }
}

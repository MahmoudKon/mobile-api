<?php

namespace App\Http\Requests\Api;

use App\Traits\HandleValidationError;
use Illuminate\Foundation\Http\FormRequest;

class ClientRequest extends FormRequest
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
            'client_name'       => 'required|unique:clients,client_name,'.request()->route()->client,
            'tele'              => 'nullable|numeric|unique:clients,tele,'.request()->route()->client,
            'mobile1'           => 'nullable|numeric|unique:clients,mobile1,'.request()->route()->client,
            'balance'           => 'nullable|numeric|min:0',
            'client_tax_number' => 'nullable|string|max:191',
            'lat'               => 'nullable|numeric',
            'lon'               => 'nullable|numeric',
            'address'           => 'nullable|string',
            'addition_data'     => 'nullable|string',
            'credit_limit'      => 'nullable|numeric|min:0',
            'date_zero'         => 'nullable|date_format:Y-m-d H:i:s',
        ];
    }
}

<?php

namespace App\Http\Requests;

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
            'tele'              => 'required|numeric|unique:clients,tele,'.request()->route()->client,
            'mobile1'           => 'nullable|numeric|unique:clients,mobile1,'.request()->route()->client,
            'balance'           => 'required|numeric|min:0',
            'client_tax_number' => 'nullable|string|max:191',
            'lat'               => 'required|numeric',
            'lon'               => 'required|numeric',
            'address'           => 'required|string',
            'addition_data'     => 'required|string',
            'credit_limit'      => 'required|numeric|min:0',
            'date_zero'         => 'required|date_format:Y-m-d H:i:s',
        ];
    }
}

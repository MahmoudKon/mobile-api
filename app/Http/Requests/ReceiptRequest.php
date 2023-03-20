<?php

namespace App\Http\Requests;

use App\Traits\HandleValidationError;
use Illuminate\Foundation\Http\FormRequest;

class ReceiptRequest extends FormRequest
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
        \Illuminate\Support\Facades\Log::info( json_encode($this->all()) );
        return [
            'details' => 'required|array|min:1',
            'details.*.client_id' => 'required|exists:clients,id',
            'details.*.bill_id' => 'nullable|exists:invoices_,id',
            'details.*.type' => 'required|in:0,1',
            'details.*.amount' => 'required|numeric',
            'details.*.date' => 'required|date_format:Y-m-d h:i:s A'
        ];
    }

    public function attributes()
    {
        return [
            'client_id' => trans('inputs.client_id'),
            'bill_id'   => trans('inputs.bill_id'),
            'type'      => trans('inputs.type'),
            'amount'    => trans('inputs.amount'),
            'date'      => trans('inputs.date'),
        ];
    }
}

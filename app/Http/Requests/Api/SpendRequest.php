<?php

namespace App\Http\Requests\Api;

use App\Traits\HandleValidationError;
use Illuminate\Foundation\Http\FormRequest;

class SpendRequest extends FormRequest
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
            'term_id'   => "required|exists:spending_item,id,shop_id,".shopId(),
            'date'      => "required|date_format:Y-m-d",
            'amount'    => "nullable|numeric|min:0",
            'local_id'  => "required|min:1",
            'notes'     => "nullable|string",
            'file'      => 'nullable|file|mimes:jpeg,png,jpg,gif,svg,pdf',
        ];
    }
}

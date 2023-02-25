<?php

namespace App\Http\Requests\Api\Auth;

use App\Traits\HandleValidationError;
use Illuminate\Foundation\Http\FormRequest;

class UnitRequest extends FormRequest
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
            'name' => "required|unique:units,name,".request()->route()->unit.",id,shop_id,".auth()->user()->shop_id
        ];
    }
}

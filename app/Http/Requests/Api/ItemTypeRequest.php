<?php

namespace App\Http\Requests\Api;

use App\Traits\HandleValidationError;
use Illuminate\Foundation\Http\FormRequest;

class ItemTypeRequest extends FormRequest
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
            'name' => "required|unique:items_type,name,".request()->route()->item_type.",id,shop_id,".auth()->user()->shop_id,
            'upload_img' => (request()->route()->item_type ? 'nullable' : 'required') . '|image|mimes:jpeg,png,jpg,gif,svg',
        ];
    }
}

<?php

namespace App\Http\Requests\Api;

use App\Traits\HandleValidationError;
use Illuminate\Foundation\Http\FormRequest;

class ListClientLineRequest extends FormRequest
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
            'lat' => ['required', 'numeric'],
            'lon' => ['required', 'numeric']
        ];
    }

    public function attributes()
    {
        return [
            'lat' => trans('inputs.lat'),
            'lon' => trans('inputs.lon')
        ];
    }
}

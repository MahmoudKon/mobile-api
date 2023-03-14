<?php

namespace App\Http\Requests\Api;

use App\Traits\HandleValidationError;
use Illuminate\Foundation\Http\FormRequest;

class LocationRequest extends FormRequest
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
        if ($this->isMethod('POST')) {
            return $this->storeRules();
        } elseif ($this->isMethod('PUT')) {
            return $this->updateRules();
        }
    }

    protected function storeRules(): array
    {
        return [
            'details' => "required|array|min:1",
            'details.*.time' => "nullable|date_format:Y-m-d H:i:s",
            'details.*.lon' => "required|string",
            'details.*.lat' => "required|string",
        ];
    }

    protected function updateRules(): array
    {
        return [
            'time' => "required|date_format:Y-m-d H:i:s",
            'lon' => "required|string",
            'lat' => "required|string",
        ];
    }
}

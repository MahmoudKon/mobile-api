<?php

namespace App\Http\Requests\Api\Auth;

use App\Traits\HandleValidationError;
use Illuminate\Foundation\Http\FormRequest;

class LoginRequest extends FormRequest
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
            'user_name' => 'required|string',
            'password'  => 'required|string',
            'player_id' => 'nullable|string',
        ];
    }

    public function attributes()
    {
        return [
            'user_name' => trans('inputs.user_name'),
            'password'  => trans('inputs.password'),
            'player_id' => trans('inputs.player_id'),
        ];
    }
}

<?php

namespace App\Traits;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;

trait HandleValidationError
{
    public function failedValidation(Validator $validator)
    {
        if (request()->is(env('API_CHECK_REQUEST', 'api/*'))) {
            throw new HttpResponseException(response()->json([
                'status'    => false,
                'message'   => 'Validation errors',
                'errors'    => $this->getErrorsAsArray( $validator->errors()->getMessages() )
            ], 200));
        } else {
            parent::failedValidation($validator);
        }
    }

    protected function getErrorsAsArray(array $errors): array
    {
        $rows = [];

        foreach ($errors as $key => $error)
            $rows[$key] = $error[0];

        return $rows;
    }
}
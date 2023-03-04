<?php

namespace App\Http\Controllers\Api\Auth;

use App\Http\Controllers\BasicApiController;
use App\Http\Requests\Api\Auth\LoginRequest;
use App\Http\Resources\UsersResource;
use Illuminate\Http\Request;

class LoginController extends BasicApiController
{
    public function login(LoginRequest $request): \Illuminate\Http\JsonResponse
    {
        if (auth()->attempt($this->credentials($request))) {
            if ( ! authUser()->shop->checkIsActive() )
                return $this->sendError('You subscription expire');

            if (authUser()->login == 0)
                return $this->sendError('You don\'t have the permission to login');

            if ($request->player_id)
                authUser()->update(['player_id' => $request->player_id]);

            return $this->sendResponse('User login successfully.', self::createToken());
        } else {
            return $this->sendError('These credentials do not match our records.');
        }
    }

    protected function credentials(Request $request): array
    {
        return [
            'user_name' => $request->user_name,
            'password'  => $request->password,
        ];
    }

    public static function createToken(): array
    {
        authUser()->tokens()->delete();
        authUser()->load('shop');
        return [
            'token' => authUser()->createToken(env('API_HASH_TOKEN', 'badr'))->accessToken->token,
            'user'  => new UsersResource(authUser()),
        ];
    }
}

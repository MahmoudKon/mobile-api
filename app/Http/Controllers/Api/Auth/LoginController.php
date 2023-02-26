<?php

namespace App\Http\Controllers\Api\Auth;

use App\Http\Controllers\BasicApiController;
use App\Http\Requests\Api\Auth\LoginRequest;
use App\Http\Resources\UsersResource;
use Carbon\Carbon;
use Illuminate\Http\Request;

class LoginController extends BasicApiController
{
    public function login(LoginRequest $request): \Illuminate\Http\JsonResponse
    {
        if (auth()->attempt($this->credentials($request))) {

            if (Carbon::parse(auth()->user()->run_date) < today())
                return $this->sendError('You subscription expire');

            if (auth()->user()->login == 0)
                return $this->sendError('You don\'t have the permission to login');

            if ($request->player_id)
                auth()->user()->update(['player_id' => $request->player_id]);

            return $this->sendResponse('User login successfully.', $this->createToken());
        } else {
            return $this->sendError('These credentials do not match our records.');
        }
    }

    public function refresh(): \Illuminate\Http\JsonResponse
    {
        $this->deleteOldTokens();
        return $this->sendResponse('Token refreshed successfully.', $this->createToken());
    }

    public function profile(): \Illuminate\Http\JsonResponse
    {
        auth()->user()->load('shop', 'salePoint');
        return $this->sendResponse('', ['data' => new UsersResource(auth()->user())]);
    }

    public function logout(): \Illuminate\Http\JsonResponse
    {
        $this->deleteOldTokens();
        return $this->sendResponse('User Logged out');
    }

    protected function credentials(Request $request): array
    {
        return [
            'user_name' => $request->user_name,
            'password'  => $request->password,
        ];
    }

    protected function createToken(): array
    {
        $this->deleteOldTokens();
        auth()->user()->load('shop');
        return [
            'token' => auth()->user()->createToken(env('API_HASH_TOKEN', 'badr'))->accessToken->token,
            'user'  => new UsersResource(auth()->user()),
        ];
    }

    protected function deleteOldTokens(): void
    {
        auth()->user()->tokens()->delete();
    }
}

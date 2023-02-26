<?php

namespace App\Http\Controllers\Api\Auth;

use App\Http\Controllers\BasicApiController;
use App\Http\Resources\UsersResource;
use Illuminate\Http\Request;

class UserController extends BasicApiController
{
    public function refresh(): \Illuminate\Http\JsonResponse
    {
        return $this->sendResponse('Token refreshed successfully.', LoginController::createToken());
    }

    public function profile(): \Illuminate\Http\JsonResponse
    {
        auth()->user()->load('shop', 'salePoint');
        return $this->sendResponse('', ['data' => new UsersResource(auth()->user())]);
    }

    public function logout(): \Illuminate\Http\JsonResponse
    {
        auth()->user()->tokens()->delete();
        return $this->sendResponse('User Logged out');
    }
}

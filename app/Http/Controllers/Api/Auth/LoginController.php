<?php

namespace App\Http\Controllers\Api\Auth;

use App\Http\Controllers\BasicApiController;
use App\Http\Resources\UsersResource;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class LoginController extends BasicApiController
{
    /**
     * login api
     *
     * @return \Illuminate\Http\Response
     */
    public function login(Request $request)
    {
        $validated = $this->validateLogin($request->all());
        $credential = [
            'user_name' => $validated['credential']['user_name'],
            'password'  => $validated['credential']['password']
        ];

        if (count($validated['errors']) > 0)
            return $this->sendError('', $validated['errors']);

        $user = User::where('user_name', $credential['user_name'])->first();

        if (! Hash::check($credential['password'], $user->password)) {
            return $this->sendError('', ['errors' => 'بيانات تسجيل الدخول خاطئة']);
        }

        if (auth()->setUser($user)) {
            if (Carbon::parse(auth()->user()->run_date) < today())
                return $this->sendError('You subscription expire');

            if (auth()->user()->login == 0)
                return $this->sendError('You don\'t have the permission to login');

            if ($request->player_id)
                auth()->user()->update(['player_id' => $validated['credential']['player_id']]);

            return $this->sendResponse('User login successfully.', $this->createToken());
        } else {
            return $this->sendError('Unauthorized please contact admin.');
        }
    }

    /**
     * refresh api
     *
     * @return \Illuminate\Http\Response
     */
    public function refresh()
    {
        $this->deleteOldTokens();
        return $this->sendResponse('Token refreshed successfully.', $this->createToken());
    }

    /**
     * saveMobileToken api
     *
     *  @return \Illuminate\Http\Response
     */
    public function saveMobileToken(): \Illuminate\Http\Response
    {
        if (! request()->mobile_token)
            return $this->sendError('Mobile token is required');

        auth()->user()->update(['mobile_token' => request('mobile_token')]);
        return $this->sendResponse('Mobile token saved successfully');
    }

    /**
     * createToken
     * To create returned data with create auth token
     *
     *  @return array
     */
    protected function createToken(): array
    {
        $this->deleteOldTokens();
        auth()->user()->load('shop');
        return [
            'token' => auth()->user()->createToken(env('API_HASH_TOKEN', 'badr'))->accessToken->token,
            'user'  => new UsersResource(auth()->user()),
        ];
    }

    /**
     * deleteOldTokens
     * to delete old tokens
     *
     *  @return void
     */
    protected function deleteOldTokens(): void
    {
        auth()->user()->tokens()->delete();
    }

    /**
     * validateLogin
     * to validate request data
     *
     *  @return array
     */
    protected function validateLogin(array $data = []): array
    {
        $errors = [];
        $validator = Validator::make($data, [
            'user_name' => 'required|string|exists:users,user_name',
            'password'  => 'required|string',
            'player_id' => 'nullable|string'
        ]);

        if (count($validator->getMessageBag()->messages()) > 0)
            foreach ($validator->getMessageBag()->messages() as $input => $error) $errors[$input] = $error[0];

        return ['errors' => $errors, 'credential' => $validator->getData()];
    }

    /**
     * profile
     *
     *  @return \Illuminate\Http\JsonResponse
     */
    public function profile(): \Illuminate\Http\JsonResponse
    {
        auth()->user()->load('shop');
        return $this->sendResponse('', ['data' => new UsersResource(auth()->user())]);
    }

    /**
     * logout
     *
     *  @return \Illuminate\Http\JsonResponse
     */
    public function logout(): \Illuminate\Http\JsonResponse
    {
        $this->deleteOldTokens();
        return $this->sendResponse('User Logged out');
    }
}

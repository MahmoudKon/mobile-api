<?php

namespace App\Providers;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        if (request()->is(env('API_CHECK_REQUEST', 'api/*'))) {
            $this->setAuth();
        }
    }

    protected function setAuth()
    {
        if (! request()->has("api_token") || blank(request()->get("api_token")) ) return;
        $token = request()->get("api_token");
        $row = DB::table('personal_access_tokens')->select('tokenable_type', 'tokenable_id')->where('token', $token)->first();
        if (! $row) return;
        $user = app($row->tokenable_type)->where('id', $row->tokenable_id)->first();
        if (!$user) return ;
        auth()->setUser($user);
    }
}

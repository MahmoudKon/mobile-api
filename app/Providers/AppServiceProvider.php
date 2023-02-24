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
        if (request()->is('*/api/*')) {
            $this->setAuth();
        }
    }

    protected function setAuth()
    {
        if (! isset(request()->header()['authorization'])) return;
        $token = str_ireplace('Bearer ', '', request()->header()['authorization'][0]);
        $row = DB::table('personal_access_tokens')->select('tokenable_type', 'tokenable_id')->where('token', $token)->first();
        if (! $row) return;
        $user = app($row->tokenable_type)->where('id', $row->tokenable_id)->first();
        if (!$user) return ;
        auth()->setUser($user);
    }
}

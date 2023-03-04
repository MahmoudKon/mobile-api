<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class LineMiddlewar
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        if (authUser()) return response()->json(['status' => false, 'message' => 'Cannot See This Page']);
        return $next($request);
    }
}

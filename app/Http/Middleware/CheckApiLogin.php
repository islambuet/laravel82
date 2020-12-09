<?php

namespace App\Http\Middleware;
use Illuminate\Support\Facades\Auth; 

use Closure;
use Illuminate\Http\Request;

class CheckApiLogin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        if(!(Auth::guard('api')->check()))
        {
            return response()->json(['errorStr'=>'LOGIN_REQUIRED','message'=>'User Not Registered'], 401);
        }        
        return $next($request);
    }
}

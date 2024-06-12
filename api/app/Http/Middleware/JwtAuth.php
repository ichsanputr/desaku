<?php

namespace App\Http\Middleware;

use Closure;
use Firebase\JWT\Key;
use Firebase\JWT\JWT;
use UnexpectedValueException;
use LogicException;

class JwtAuth
{
    public function handle($request, Closure $next)
    {
        try {
            $decoded = JWT::decode($request->bearerToken(), new Key('desaku89ajs', 'HS256'));
            $request->merge([
                'is_admin' => $decoded->is_admin == 1 ? true : false,
                'user' => $decoded->user,
            ]);
        } catch (LogicException $e) {
            abort(401, 'Unauthorized');
        } catch (UnexpectedValueException $e) {
            abort(401, 'Unauthorized');
        }

        return $next($request)
            ->header('Access-Control-Allow-Origin', '*')
            ->header('Access-Control-Allow-Methods', '*')
            ->header('Access-Control-Allow-Credentials', true)
            ->header('Access-Control-Allow-Headers', 'X-Requested-With,Content-Type,X-Token-Auth,Authorization')
            ->header('Accept', 'application/json');
    }
}
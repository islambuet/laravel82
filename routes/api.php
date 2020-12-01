<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
//use App\Http\Controllers\UserController;
use App\Http\Controllers\NotFoundController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
// Route::middleware('auth:api')->get('user', function (Request $request) {
//     return $request->user();
// });
Route::get('user/initialize', [App\Http\Controllers\UserController::class, 'initialize']);
Route::get('user/login', [App\Http\Controllers\UserController::class,'login']);
Route::post('user/login', [App\Http\Controllers\UserController::class,'login']);
Route::get('user', [App\Http\Controllers\UserController::class,'getUser']);

Route::fallback([NotFoundController::class,'index']);

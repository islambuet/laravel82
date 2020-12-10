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
Route::get('user/logout', [App\Http\Controllers\UserController::class,'logout']);
Route::post('user/logout', [App\Http\Controllers\UserController::class,'logout']);
Route::post('user/register', [App\Http\Controllers\UserController::class,'register']);
Route::get('user', [App\Http\Controllers\UserController::class,'getUser']);


Route::get('sys_module_task', [App\Http\Controllers\ModuleTaskController::class, 'initialize']);
Route::get('sys_module_task/get_items', [App\Http\Controllers\ModuleTaskController::class, 'getItems']);
Route::get('sys_module_task/get_item/{id}', [App\Http\Controllers\ModuleTaskController::class, 'getItem']);
Route::post('sys_module_task/save_item', [App\Http\Controllers\ModuleTaskController::class, 'saveItem']);

Route::get('sys_user_group', [App\Http\Controllers\UserGroupController::class, 'initialize']);
Route::get('sys_user_group/get_items', [App\Http\Controllers\UserGroupController::class, 'getItems']);
Route::get('sys_user_group/get_item/{id}', [App\Http\Controllers\UserGroupController::class, 'getItem']);
Route::post('sys_user_group/save_item', [App\Http\Controllers\UserGroupController::class, 'saveItem']);
Route::post('sys_user_group/save_role/{id}', [App\Http\Controllers\UserGroupController::class, 'saveRole']);

Route::fallback([NotFoundController::class,'index']);

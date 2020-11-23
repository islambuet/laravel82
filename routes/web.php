<?php

use Illuminate\Support\Facades\Route;
use App\Http\Livewire\NotFoundComponent;
use App\Http\Livewire\HomeComponent;
use App\Http\Livewire\SetupProducts;
use App\Http\Livewire\ShopComponent;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::get('/', HomeComponent::class);


Route::middleware(['auth:sanctum', 'verified'])->get('/dashboard', function () {
    return view('dashboard');
})->name('dashboard');

// Route::get('/linkstorage', function () {
//     Artisan::call('storage:link');
// });

Route::get('/setup_products',SetupProducts::class)->name('setup_products');
Route::get('/shop',ShopComponent::class)->name('shop');
Route::fallback(NotFoundComponent::class);
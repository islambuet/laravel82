composer create-project --prefer-dist laravel/laravel laravel82
composer require livewire/livewire
composer require laravel/jetstream
php artisan jetstream:install livewire
php artisan livewire:publish --assets//no need

php artisan make:model UserGroup -m
php artisan make:model SystemTask -m
php artisan migrate

npm install
npm run dev

php artisan make:livewire HomeComponent
php artisan make:livewire theme.Header

php artisan storage:link
// Route::get('/linkstorage', function () {
//     Artisan::call('storage:link');
// });
//hit the link to create storage link at live server

use WithPagination; inside class must

DB::raw("'".$param1."'")
DB::enableQueryLog();
$lastquery = dd(DB::getQueryLog());
toArray()//returns query result in arary

composer require stripe/stripe-php

//from github to update
1.composer install
2.discard changes from gitdesktop
3.database
4.env file
5.run env key command
///////////////

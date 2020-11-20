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
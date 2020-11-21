<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Faker\Factory as Faker;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // $faker=Faker::create();
        // foreach(range(1,100) as $index)
        // {
        //     DB::table('products')->insert([
        //         'name' => $faker->name,
        //         'price' => rand(10,100000)/100
        //     ]);
        // }
    }
}

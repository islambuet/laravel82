<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('mobile_no')->unique();
            $table->string('password');            
            $table->string('status',10)->default('Active');
            $table->string('name_en');
            $table->string('name_bn');
            $table->string('email')->unique();
            $table->smallInteger('user_group_id')->default(4);                    
            $table->timestamp('email_verified_at')->nullable();            
            $table->rememberToken();            
            $table->text('profile_photo_path')->nullable();
            $table->integer('created_by')->nullable();
            $table->integer('updated_by')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}

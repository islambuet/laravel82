<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUserGroupsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('user_groups', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('status',10)->default('Active');
            $table->smallInteger('ordering')->default(99);
            $table->timestamps();
            $table->integer('created_by')->nullable();
            $table->integer('updated_by')->nullable();

            $table->string('action_0',500)->default(',');
            $table->string('action_1',500)->default(',');
            $table->string('action_2',500)->default(',');
            $table->string('action_3',500)->default(',');
            $table->string('action_4',500)->default(',');
            $table->string('action_5',500)->default(',');
            $table->string('action_6',500)->default(',');
            $table->string('action_7',500)->default(',');
            $table->string('action_8',500)->default(',');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('user_groups');
    }
}

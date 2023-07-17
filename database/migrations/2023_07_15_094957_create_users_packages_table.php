<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersPackagesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users_packages', function (Blueprint $table) {
            $table->id();
            $table->integer("user_id")->default(0)->comment("package user");
            $table->integer("package_id")->default(0)->comment("package id");
            $table->date("start_at")->comment("package start date");
            $table->date("end_at")->comment("package end date");
            $table->enum("status", \App\Enums\UserPackaesStatusEnums::getValues())->default(\App\Enums\UserPackaesStatusEnums::Option_0);
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
        Schema::dropIfExists('users_packages');
    }
}

<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users_orders', function (Blueprint $table) {
            $table->id();
            $table->integer("user_id")->default(0)->comment("package user");
            $table->integer("package_id")->default(0)->comment("package id");
            $table->char("order_sn")->unique()->comment("order sn");
            $table->double("price", 8, 2)->comment("order price");
            $table->integer("counpons_id")->default(0)->comment("counpons id");
            $table->timestamps();
            $table->index(["user_id"]);
            $table->index(["package_id"]);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users_orders');
    }
}

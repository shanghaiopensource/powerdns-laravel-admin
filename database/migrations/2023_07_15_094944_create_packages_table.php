<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePackagesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('packages', function (Blueprint $table) {
            $table->id();
            $table->string("title")->comment("package title");
            $table->string("description")->comment("package description");
            $table->date("start_at")->comment("package start date");
            $table->date("end_at")->comment("package end date");
            $table->double("price", 8, 2)->comment("package price");
            $table->enum("status", \App\Enums\PackaesStatusEnums::getValues())->default(\App\Enums\PackaesStatusEnums::Option_0)->comment("package status 0 disable, 1 enable");
            $table->json("owner")->comment("package owner");
            $table->json("rules")->comment("package rules");
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
        Schema::dropIfExists('packages');
    }
}

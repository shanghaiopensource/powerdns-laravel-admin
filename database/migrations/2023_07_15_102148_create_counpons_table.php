<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCounponsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('counpons', function (Blueprint $table) {
            $table->id();
            $table->string("name")->comment("counpon name");
            $table->double("price")->comment("counpon price");
            $table->integer("number")->comment("counpon number");
            $table->date("start_at")->comment("counpon start date");
            $table->date("end_at")->comment("counpon end date");
            $table->enum("status", \App\Enums\CounponsStatusEnums::getValues())->default(\App\Enums\CounponsStatusEnums::Option_0);
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
        Schema::dropIfExists('counpons');
    }
}

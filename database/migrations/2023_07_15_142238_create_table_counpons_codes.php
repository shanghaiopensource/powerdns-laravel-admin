<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTableCounponsCodes extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('counpons_codes', function (Blueprint $table) {
            $table->id();
            $table->integer("counpons_id")->comment("counpons id");
            $table->char("code", 10)->comment("code");
            $table->integer("user_id");
            $table->enum("status", \App\Enums\CounponsCodeStatusEnums::getValues())->default(\App\Enums\CounponsCodeStatusEnums::Option_0);
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
        Schema::dropIfExists('table_counpons_codes');
    }
}

<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductPizzasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('product_pizzas', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('pizza_id');
            $table->integer('product_id');
            $table->double('qty');
            $table->double('recieved');
            $table->integer('pizza_unit_id');
            $table->double('net_unit_cost');
            $table->double('discount');
            $table->double('tax_rate');
            $table->double('tax');
            $table->double('total');
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
        Schema::dropIfExists('product_pizzas');
    }
}

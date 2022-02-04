<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pizza extends Model
{
    use HasFactory;
    protected $table = 'pizzas';
    
    public function products() { 
        return $this->belongsToMany(Product::class, 'product_pizzas');  
    }
    
    public function pizzas()
    {
        return $this->belongsToMany(Pizza::class, 'product_pizzas');
    }

    public function supplier()
    {
    	return $this->belongsTo('App\Supplier');
    }

    public function warehouse()
    {
    	return $this->belongsTo('App\Warehouse');
    }
}

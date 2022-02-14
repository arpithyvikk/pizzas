<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Purchase extends Model
{
    protected $fillable =[

        "reference_no", "user_id", "warehouse_id", "supplier_id", "item", "total_qty", "document", "note"
    ];

    public function supplier()
    {
    	return $this->belongsTo('App\Supplier');
    }

    public function warehouse()
    {
    	return $this->belongsTo('App\Warehouse');
    }
}

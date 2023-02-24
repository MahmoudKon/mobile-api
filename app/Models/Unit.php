<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Traits\FilterPerShop;

class Unit extends Model
{
    use FilterPerShop;

    protected $table = 'units';
    protected $guarded = ['id'];
    public $timestamps = false;

//    public function items()
//    {
//        return $this->belongsToMany(Item::class,'items_unit');
//    }
//    public function item()
//    {
//        return $this->hasMany(Item::class,'unit_id');
//    }
//    public function saleDetails()
//    {
//        return $this->hasMany(SaleDetails::class,'unit');
//    }
//    public function incomingDetails()
//    {
//        return $this->hasMany(IncomingDetails::class,'unit');
//    }
}

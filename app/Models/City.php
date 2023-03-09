<?php

namespace App\Models;

use App\Traits\FilterPerShop;
use Illuminate\Database\Eloquent\Model;

class City extends Model
{
    use FilterPerShop;
    
    protected $table = 'cities';
    protected $guarded = ['id'];
    public $timestamps = false;
}

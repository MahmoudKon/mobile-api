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
}

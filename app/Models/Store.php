<?php

namespace App\Models;

use App\Traits\FilterPerShop;
use Illuminate\Database\Eloquent\Model;

class Store extends Model
{
    use FilterPerShop;

    protected $table = 'stores';
    protected $guarded = ['id'];
    public $timestamps = false;
}

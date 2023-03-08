<?php

namespace App\Models;

use App\Traits\FilterPerShop;
use Illuminate\Database\Eloquent\Model;

class StoreItem extends Model
{
    use FilterPerShop;

    protected $table = 'store_items';
    protected $guarded = ['id'];
    public $timestamps = false;
}

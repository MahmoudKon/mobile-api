<?php

namespace App\Models;

use App\Traits\FilterPerShop;
use Illuminate\Database\Eloquent\Model;

class ItemTransaction extends Model
{
    use FilterPerShop;

    protected $table = 'items_transaction';
    protected $guarded = ['id'];
    public $timestamps = false;
}

<?php

namespace App\Models;

use App\Traits\FilterPerShop;
use Illuminate\Database\Eloquent\Model;

class SpendItem extends Model
{
    use FilterPerShop;

    protected $table = 'spending_item';
    protected $guarded = ['id'];
    public $timestamps = false;
}

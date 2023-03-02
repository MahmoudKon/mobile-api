<?php

namespace App\Models;

use App\Traits\FilterPerShop;
use Illuminate\Database\Eloquent\Model;

class BillAdd extends Model
{
    use FilterPerShop;

    protected $table = 'bills_add';
    protected $guarded = ['id'];
    public $timestamps = false;
}

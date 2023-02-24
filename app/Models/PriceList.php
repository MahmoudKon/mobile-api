<?php

namespace App\Models;

use App\Traits\FilterPerShop;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PriceList extends Model
{
    use FilterPerShop;

    protected  $table = 'prices_list';
    protected $guarded = ['id'];

    public $timestamps = false;
}

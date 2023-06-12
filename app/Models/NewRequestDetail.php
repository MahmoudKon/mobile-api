<?php

namespace App\Models;

use App\Traits\FilterPerShop;
use Illuminate\Database\Eloquent\Model;

class NewRequestDetail extends Model
{
    use FilterPerShop;

    protected $table = 'request_details';

    protected $fillable = ['shop_id', 'request_id', 'item_id', 'quantity', 'price', 'unit_id', 'water', 'protein', 'fats'];
}

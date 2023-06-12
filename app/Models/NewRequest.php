<?php

namespace App\Models;

use App\Traits\FilterPerShop;
use Illuminate\Database\Eloquent\Model;

class NewRequest extends Model
{
    use FilterPerShop;

    protected $table = 'requests';

    protected $fillable = ['shop_id', 'user_id', 'store_id', 'client_id', 'total', 'no_bill', 'order_no', 'net', 'type', 'rest', 'created_at'];

    public $timestamps = false;

    const PURCHASES = 0;
    
    const SALES = 1;

    const BACK_PURCHASES = 2;

    const BACK_SALES = 3;

    public static function getMax()
    {
        return self::query()->max('order_no') + 1;
    }
}

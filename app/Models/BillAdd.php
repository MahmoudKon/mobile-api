<?php

namespace App\Models;

use App\Traits\FilterPerShop;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Model;

class BillAdd extends Model
{
    use FilterPerShop;

    protected $table = 'bills_add';
    protected $guarded = ['id'];
    public $timestamps = false;

    protected function additionValue(): Attribute
    {
        return Attribute::make(
            set: fn ($value) => format_price($value ?? 0),
        );
    }
}

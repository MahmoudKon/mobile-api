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
    
    protected function value(): Attribute
    {
        return Attribute::make(
            get: fn ($value) => format_price($value ?? 0),
        );
    }
    
    protected function type(): Attribute
    {
        return Attribute::make(
            get: fn ($value) => $value ? 'value' : 'precent',
        );
    }
}

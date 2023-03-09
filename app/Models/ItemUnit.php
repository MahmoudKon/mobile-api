<?php

namespace App\Models;

use App\Traits\FilterPerShop;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Model;

class ItemUnit extends Model
{
    use FilterPerShop;

    protected $table = 'items_unit';
    protected $guarded = ['id'];
    public $timestamps = false;

    protected function unitValue(): Attribute
    {
        return Attribute::make(
            get: fn ($value) => format_price($value ?? 0),
        );
    }

    protected function unitPrice(): Attribute
    {
        return Attribute::make(
            get: fn ($value) => format_price($value ?? 0),
        );
    }
}

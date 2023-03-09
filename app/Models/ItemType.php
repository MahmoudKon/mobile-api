<?php

namespace App\Models;

use App\Traits\FilterPerShop;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Model;

class ItemType extends Model
{
    use FilterPerShop;

    protected $table = 'items_type';

    protected $guarded = ['id'];

    public $timestamps = false;

    protected function uploadImg(): Attribute
    {
        return Attribute::make(
            get: fn ($value) => config('app.img_url').$value,
        );
    }
}

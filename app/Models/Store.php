<?php

namespace App\Models;

use App\Traits\FilterPerShop;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Model;

class Store extends Model
{
    use FilterPerShop;

    protected $table = 'stores';
    
    protected function img(): Attribute
    {
        return Attribute::make(
            get: fn ($value) => $value ? config('app.img_url').$value : '',
        );
    }
}

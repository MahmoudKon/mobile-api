<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ItemType extends Model
{
    protected $table = 'items_type';

    protected function uploadImg(): Attribute
    {
        return Attribute::make(
            get: fn ($value) => config('app.img_url').$value,
        );
    }

    public function items()
    {
        return $this->hasMany('App\Item','sale_unit');
    }
    public function getLimitedItemsAttribute($value)
    {
        return $this->items()->where('online',1)->take(4)->get();
    }
}

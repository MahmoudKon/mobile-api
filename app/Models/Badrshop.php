<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Hash;

class Badrshop extends Model
{
    use HasFactory;
    protected $table = 'badr_shop';

    protected function logoPath(): Attribute
    {
        return Attribute::make(
            get: fn ($value) => config('app.img_url').$value,
        );
    }

    protected static function boot()
    {
        parent::boot();

        static::addGlobalScope('perShop', function (Builder $builder) {
            $shop_id = auth()->user()->shop_id ?? 21036;
            $builder->where('serial_id', $shop_id);
        });
    }
}

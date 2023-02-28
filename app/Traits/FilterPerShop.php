<?php

namespace App\Traits;

use Illuminate\Database\Eloquent\Builder;

trait FilterPerShop
{
    protected static function boot()
    {
        parent::boot();

        static::addGlobalScope('perShop', function (Builder $builder) {
            $builder->where('shop_id', shopId())->orderBy('id', 'desc');
        });

        static::creating(function ($model) {
            $model->shop_id = shopId();
        });
    }
}

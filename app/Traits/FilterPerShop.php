<?php

namespace App\Traits;

use Illuminate\Database\Eloquent\Builder;

trait FilterPerShop
{
    protected static function boot()
    {
        parent::boot();

        static::addGlobalScope('perShop', function (Builder $builder) {
            $shop_id = auth()->user()->shop_id ?? 21036;
            $builder->where('shop_id', $shop_id)->orderBy('id', 'desc');
        });

        static::creating(function ($model) {
            $model->shop_id = auth()->user()->shop_id ?? 21036;
        });
    }
}

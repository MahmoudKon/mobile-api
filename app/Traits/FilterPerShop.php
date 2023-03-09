<?php

namespace App\Traits;

use Illuminate\Database\Eloquent\Builder;

trait FilterPerShop
{
    protected static function boot()
    {
        parent::boot();

        static::addGlobalScope('perShop', function (Builder $builder) {
            $current_class = app(__CLASS__)->getTable();
            $builder->where("$current_class.shop_id", shopId())->orderBy("$current_class.id", 'desc');
        });

        static::creating(function ($model) {
            $model->shop_id = shopId();
        });
    }
}

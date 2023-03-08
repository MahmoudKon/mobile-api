<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;

class Log extends Model
{
	protected $table = 'log_system';
	public $timestamps = false;
	protected $guarded = ['id'];

    protected static function boot()
    {
        parent::boot();

        static::addGlobalScope('perShop', function (Builder $builder) {
            $builder->where('shop_id', shopId())->orderBy('id', 'desc');
        });

        static::creating(function ($model) {
            $model->shop_id    = shopId();
            $model->user_id    = authId();
            $model->date_event = now();
        });
    }
}

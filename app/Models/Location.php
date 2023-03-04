<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;

class Location extends Model
{
    protected  $table = 'user_location';
    protected $guarded = ['id'];
    public $timestamps = false;

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'id')->select('id', 'user_name as name')->withDefault(['id' => '', 'name' => '']);
    }

    protected static function boot()
    {
        parent::boot();

        static::addGlobalScope('perShop', function (Builder $builder) {
            $builder->where('shop_id', shopId())->where('user_id', authId())->orderBy('id', 'desc');
        });

        static::creating(function ($model) {
            $model->shop_id = shopId();
            $model->user_id = authId();
        });
    }
}

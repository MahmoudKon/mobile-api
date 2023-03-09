<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Model;

class Spending extends Model
{
    protected $table = 'spending';
    protected $guarded = ['id'];
    public $timestamps = false;

    protected function amount(): Attribute
    {
        return Attribute::make(
            get: fn ($value) => format_price($value ?? 0),
        );
    }

    public function spendItem()
    {
        return $this->belongsTo(SpendItem::class, 'spend_id')->select('id', 'name')->withDefault(['id' => '', 'name' => '']);
    }

    protected static function boot()
    {
        parent::boot();

        static::addGlobalScope('perShop', function (Builder $builder) {
            $builder->where('shop_id', shopId())->orderBy('id', 'desc');
        });

        static::creating(function ($model) {
            $model->shop_id   = shopId();
            $model->add_user  = authId();
            $model->edit_user = authId();
            $model->edit_date = now();
            $model->add_date  = now();
        });
    }
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Location extends Model
{
    protected  $table = 'user_location';
    protected $guarded = ['id'];
    public $timestamps = false;

    public function user()
    {
        return $this->belongsTo(User::class)->select('id', 'name')->withDefault(['id' => '', 'name' => '']);
    }

    protected static function boot()
    {
        parent::boot();

        static::addGlobalScope('perShop', function (Builder $builder) {
            $shop_id = auth()->user()->shop_id ?? 21036;
            $builder->where('shop_id', $shop_id)->where('user_id', auth()->id() ?? 3)->orderBy('id', 'desc');
        });

        static::creating(function ($model) {
            $model->shop_id = auth()->user()->shop_id ?? 21036;
            $model->user_id = auth()->id() ?? 3;
        });
    }
}

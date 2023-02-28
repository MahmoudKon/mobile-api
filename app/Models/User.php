<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Contracts\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\Hash;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    protected function password(): Attribute
    {
        return Attribute::make(
            set: fn ($value) => Hash::make($value),
        );
    }

    public function shop()
    {
        return $this->belongsTo(Badrshop::class, 'shop_id', 'serial_id')->select('serial_id', 'run_date', 'online', 'shop_name', 'decimal_num_price', 'decimal_num_quant', 'sale_details', 'currency', 'allow_lines');
    }

    public function salePoint()
    {
        return $this->belongsTo(SalePoint::class, 'sale_point', 'id')->with('store');
    }

    public function line()
    {
        return $this->hasOne(Line::class, 'representative_id', 'id');
    }

    protected static function boot()
    {
        parent::boot();

        static::addGlobalScope('perShop', function (Builder $builder) {
            $builder->when(auth()->user(), function ($query) {
                $query->where('shop_id', shopId());
            });
        });
    }
}

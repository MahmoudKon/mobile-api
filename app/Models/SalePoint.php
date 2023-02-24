<?php

namespace App\Models;

use App\Traits\FilterPerShop;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Model;

class SalePoint extends Model
{
    use FilterPerShop;
    
    protected $table = 'sale_points';
    protected $guarded = ['id'];
    public $timestamps = false;

    public function moneyPoint(): Attribute
    {
        return Attribute::make(
            get: fn ($value) => $value ?? 0,
        );
    }

    public function store()
    {
        return $this->belongsTo(Store::class, 'store_id', 'id')->select('id', 'name')->withDefault(['id' => '', 'name' => 'المخزن الرئيسي']);
    }
}

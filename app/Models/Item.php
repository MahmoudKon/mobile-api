<?php

namespace App\Models;

use App\Traits\FilterPerShop;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Item extends Model
{
    use FilterPerShop;

    protected $table = 'items';
    protected $guarded = ['id'];
    public $timestamps = false;

    protected function img(): Attribute
    {
        return Attribute::make(
            get: fn ($value) => config('app.img_url').$value,
        );
    }

    public function type()
    {
        return $this->belongsTo(ItemType::class, 'sale_unit', 'id')->select('id', 'name')->withDefault(['id' => '', 'name' => '']);
    }

    public function unit()
    {
        return $this->belongsTo(Unit::class)->select('id', 'name')->withDefault(['id' => '', 'name' => '']);
    }

    public function stores()
    {
        return $this->belongsToMany(Store::class,'store_items')->select('stores.id', 'stores.store_name as name')->withPivot('store_quant');
    }
}

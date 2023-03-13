<?php

namespace App\Models;

use App\Traits\FilterPerShop;
use Illuminate\Database\Eloquent\Casts\Attribute;
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

    protected function salePrice(): Attribute
    {
        return Attribute::make(
            get: fn ($value) => format_price($value ?? 0),
        );
    }

    protected function lowestPrice(): Attribute
    {
        return Attribute::make(
            get: fn ($value) => format_price($value ?? 0),
        );
    }

    protected function payPrice(): Attribute
    {
        return Attribute::make(
            get: fn ($value) => format_price($value ?? 0),
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

    public function itemStores()
    {
        return $this->hasMany(StoreItem::class, 'item_id', 'id')->select('id', 'store_quant', 'item_id', 'store_id');
    }

    public function itemUnit()
    {
        return $this->hasOne(ItemUnit::class, 'item_id', 'id')->select('id', 'unit_value', 'item_id', 'unit_price', 'item_id', 'unit_id');
    }

    public function units()
    {
        return $this->belongsToMany(Unit::class, ItemUnit::class);
    }

    public function addition()
    {
        return $this->belongsTo(BillAdd::class,'vat_id')->select('id', 'addition_value');
    }


    public function getVat()
    {
        if ($this->vat_state == 2 && !is_null($this->add)) {
            $add = $this->add;
            if ($add->check_addition == 0) {
                $value = $this->sale_price - ($this->sale_price / (($add->addition_value / 100) + 1));
                return $value;
            } elseif ($add->check_addition == 1) {
                return $add->addition_value;
            }
        }
        return "";
    }

    public function getPriceWithoutVat()
    {
        if ($this->vat_state == 2 && !is_null($this->add)) {
            $add = $this->add;
            if ($add->check_addition == 0) {
                $value = $this->sale_price / (($add->addition_value / 100) + 1);
                return $value;
            } elseif ($add->check_addition == 1) {
                return $this->sale_price - $add->addition_value;
            }
        }
        return $this->sale_price;
    }
}

<?php

namespace App\Models;

use App\Traits\FilterPerShop;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Model;

class SaleBack extends Model
{
    use FilterPerShop;

    protected $table = 'sale_back';
    protected $guarded = ['id'];
    public $timestamps = false;
    protected $appends = ['total_price'];

    public function item()
    {
        return $this->belongsTo(Item::class, 'items_id', 'id')->select('id', 'item_name', 'barcode')->withDefault(['id' => '', 'item_name' => '', 'barcode' => '']);
    }

    protected function quantity(): Attribute
    {
        return Attribute::make(
            set: fn ($value) => number_format($value, 2),
        );
    }

    protected function price(): Attribute
    {
        return Attribute::make(
            set: fn ($value) => number_format($value, 2),
        );
    }

    protected function totalPrice(): Attribute
    {
        return Attribute::make(
            set: fn ($value) => number_format($this->price * $this->quantity, 2),
        );
    }
}

<?php

namespace App\Models;

use App\Traits\FilterPerShop;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Model;

class SaleBackInvoice extends Model
{
    use FilterPerShop;

    protected $table = 'sale_back_invoice';
    protected $guarded = ['id'];
    public $timestamps = false;

    public function client()
    {
        return $this->belongsTo(Client::class, 'client_id')->select('id', 'client_name')->withDefault(['id' => '', 'client_name' => '']);
    }
    
    public function details()
    {
        return $this->hasMany(SaleBack::class, 'back_id', 'id')->select('id', 'items_id', 'quantity', 'price');
        // return $this->hasMany(SaleBack::class, 'back_id', 'id')->select('id', 'items_id', 'quantity', 'price', 'FORMAT(price * quantity, 2) as total_price');
    }

    protected function discount(): Attribute
    {
        return Attribute::make(
            set: fn ($value) => $this->getDiscount(),
        );
    }

    public function getDiscount()
    {
        return $this->discount_type ? $this->discount : $this->net_price * $this->discount / 100;
    }

    public function scopeFilterDate($query)
    {
        $query->whereDate('sale_date', (request()->date ?? date('Y-m-d')));
    }
}

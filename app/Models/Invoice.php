<?php

namespace App\Models;

use App\Traits\FilterPerShop;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Model;

class Invoice extends Model
{
    use FilterPerShop;

    protected $table = 'invoices_';
    protected $guarded = ['id'];
    public $timestamps = false;

    const PURCHASES = 0;
    const SALES = 1;
    const BACK_PURCHASES = 2;
    const BACK_SALES = 3;

    protected function billTotal(): Attribute
    {
        return Attribute::make(
            get: fn ($value) => format_price($value ?? 0),
        );
    }

    protected function netPrice(): Attribute
    {
        return Attribute::make(
            get: fn ($value) => format_price($value ?? 0),
        );
    }

    protected function payment(): Attribute
    {
        return Attribute::make(
            get: fn ($value) => format_price($value ?? 0),
        );
    }

    protected function billPayment(): Attribute
    {
        return Attribute::make(
            get: fn ($value) => format_price($value ?? 0),
        );
    }

    protected function rest(): Attribute
    {
        return Attribute::make(
            get: fn ($value) => format_price($value ?? 0),
        );
    }

    protected function balance(): Attribute
    {
        return Attribute::make(
            get: fn ($value) => format_price($value ?? 0),
        );
    }

    public function details()
    {
        return $this->hasMany(InvoiceDetails::class, 'invoice_id', 'id')->select('id', 'invoice_id', 'item_id', 'unit_id', 'quantity', 'quantity_after', 'sale_price')->with('item', 'unit');
    }

    public function client()
    {
        return $this->belongsTo(Client::class, 'client_id', 'id')->select('id', 'client_name as name')->withDefault(['id' => '', 'name' => '']);
    }
}

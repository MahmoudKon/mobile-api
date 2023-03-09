<?php

namespace App\Models;

use App\Traits\FilterPerShop;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Model;

class InvoiceDetailVat extends Model
{
    use FilterPerShop;

	protected $table = 'invoices_details_vats';
	public $timestamps = false;
	protected $guarded = ['id'];

	protected function vatValue(): Attribute
    {
        return Attribute::make(
            set: fn ($value) => format_price($value ?? 0),
        );
    }
}

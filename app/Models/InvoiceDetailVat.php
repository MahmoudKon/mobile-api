<?php

namespace App\Models;

use App\Traits\FilterPerShop;
use Illuminate\Database\Eloquent\Model;

class InvoiceDetailVat extends Model
{
    use FilterPerShop;

	protected $table = 'invoices_details_vats';
	public $timestamps = false;
	protected $guarded = ['id'];
}

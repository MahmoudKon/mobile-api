<?php

namespace App\Models;

use App\Traits\FilterPerShop;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class InvoiceDetails extends Model
{
    use FilterPerShop;

    protected $table = 'invoices_details';
    protected $guarded = ['id'];
    public $timestamps = false;
}



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

    public function item()
    {
        return $this->belongsTo(Item::class)->select('id', 'item_name');
    }

    public function unit()
    {
        return $this->belongsTo(Unit::class)->select('id', 'name');
    }
}



<?php

namespace App\Models;

use App\Traits\FilterPerShop;
use Illuminate\Database\Eloquent\Model;

class Invoice extends Model
{
    use FilterPerShop;

    protected $table = 'invoices_';
    protected $guarded = ['id'];
    public $timestamps = false;

    public function details()
    {
        return $this->hasMany(InvoiceDetails::class, 'invoice_id', 'id');
    }

    public function client()
    {
        return $this->belongsTo(Client::class, 'client_id', 'id')->select('id', 'client_name as name')->withDefault(['id' => '', 'name' => '']);
    }
}

<?php

namespace App\Models;

use App\Traits\FilterPerShop;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Invoice extends Model
{
    use FilterPerShop;

    protected $table = 'invoices_';
    protected $guarded = ['id'];
    public $timestamps = false;
}

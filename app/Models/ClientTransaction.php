<?php

namespace App\Models;

use App\Traits\FilterPerShop;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ClientTransaction extends Model
{
    use FilterPerShop;

    protected $table = 'clients_transaction';
    protected $guarded = ['id'];
    public $timestamps = false;
}

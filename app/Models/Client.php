<?php

namespace App\Models;

use App\Traits\FilterPerShop;
use Illuminate\Database\Eloquent\Model;

class Client extends Model
{
    use FilterPerShop;

    protected $table = 'clients';
    protected $guarded = ['id'];
    public $timestamps = false;

}

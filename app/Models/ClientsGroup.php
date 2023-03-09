<?php

namespace App\Models;

use App\Traits\FilterPerShop;
use Illuminate\Database\Eloquent\Model;

class ClientsGroup extends Model
{
    use FilterPerShop;

    protected $table = 'clients_groups';
    protected $guarded = ['id'];
}

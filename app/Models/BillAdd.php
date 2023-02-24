<?php

namespace App\Models;

use App\Traits\FilterPerShop;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Hash;

class BillAdd extends Model
{
    use FilterPerShop;

    protected $table = 'bills_add';

    protected function checkAddition(): Attribute
    {
        return Attribute::make(
            set: fn ($value) => $value ? 'value' : 'precent',
        );
    }
}

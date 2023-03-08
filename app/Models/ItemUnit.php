<?php

namespace App\Models;

use App\Traits\FilterPerShop;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ItemUnit extends Model
{
    use FilterPerShop;

    protected $table = 'items_unit';
    protected $guarded = ['id'];
    public $timestamps = false;
}

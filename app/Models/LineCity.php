<?php

namespace App\Models;

use App\Traits\FilterPerShop;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LineCity extends Model
{
    protected $table = 'line_cities';
    protected $guarded = ['id'];
    public $timestamps = false;
}

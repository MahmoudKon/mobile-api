<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Line extends Model
{
    protected $table = 'lines';
    protected $guarded = ['id'];
    public $timestamps = false;
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class LineClient extends Model
{
    protected $table = 'line_clients';
    protected $guarded = ['id'];
    public $timestamps = false;
}

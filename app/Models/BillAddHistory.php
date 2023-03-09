<?php

namespace App\Models;

use App\Traits\FilterPerShop;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Model;

class BillAddHistory extends Model
{
    use FilterPerShop;

    protected $table = 'bills_add_history';
    protected $guarded = ['id'];
    public $timestamps = false;

    public function getBillAddText($currency)
    {
        $bill_add = $this->bill_add;
        $bill_add .= $this->add_type ? " $currency " : " % ";
        return $bill_add;
    }

    public function addition()
    {
        return $this->belongsTo(BillAdd::class, 'addition_id', 'id')->select('id', 'Addition_name as name')->withDefalut(['id' => '', 'name' => '']);
    }

    protected function billAdd(): Attribute
    {
        return Attribute::make(
            set: fn ($value) => format_price($value ?? 0),
        );
    }

    protected function additionValue(): Attribute
    {
        return Attribute::make(
            set: fn ($value) => format_price($value ?? 0),
        );
    }
}

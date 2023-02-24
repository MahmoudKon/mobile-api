<?php

namespace App\Models;

use App\Traits\FilterPerShop;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\Pivot;

class ItemPrice extends Pivot
{
    use FilterPerShop;

    protected $table = 'items_prices';

    public function item()
    {
        return $this->belongsTo(Item::class, 'item_id', 'id')->select('id', 'item_name as name')->withDefault(['id' => '', 'name' => '']);
    }

    public function list()
    {
        return $this->belongsTo(PriceList::class, 'list_id', 'id')->select('id', 'list_name as name')->withDefault(['id' => '', 'name' => '']);
    }
}

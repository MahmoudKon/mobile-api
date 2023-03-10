<?php

namespace App\Models;

use App\Traits\FilterPerShop;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Model;

class ClientTransaction extends Model
{
    use FilterPerShop;

    protected $table = 'client_transaction';
    protected $guarded = ['id'];
    public $timestamps = false;

    public function scopePerClient($query, ?int $client_id = null)
    {
        return $query->when($client_id, function ($query) use($client_id) {
            $query->where('client_id', $client_id);
        })->where(function ($query) {
            $query->whereNull('is_deleted')->orWhere('is_deleted', 0);
        });
    }

    protected function amount(): Attribute
    {
        return Attribute::make(
            get: fn ($value) => format_price($value),
        );
    }

    protected function safeBalance(): Attribute
    {
        return Attribute::make(
            get: fn ($value) => format_price($value),
        );
    }

    public function invoice()
    {
        return $this->belongsTo(Invoice::class, 'bill_id', 'id')->select('id', 'bill_no', 'net_price', 'notes')->withDefault(['id' => '', 'bill_no' => '', 'net_price' => 0.00, 'notes' => '']);
    }

    public function client()
    {
        return $this->belongsTo(Client::class, 'client_id', 'id')->select('id', 'client_name as name')->withDefault(['id' => '', 'name' => '']);
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id')->select('id', 'user_name')->withDefault(['id' => '', 'user_name' => '']);
    }
}

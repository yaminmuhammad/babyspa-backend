<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TransactionItem extends Model
{
    use HasFactory;

    protected $fillable = [
        'users_id',
        'services_id',
        'transactions_id',
        'quantity',
    ];

    public function service()
    {
        return $this->hasOne(Service::class, 'id', 'services_id');
    }
}

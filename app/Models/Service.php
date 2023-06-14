<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Service extends Model
{
    use HasFactory, SoftDeletes;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'description',
        'price',
        'categories_id',
        'tags',
    ];

    public function galleries()
    {
        return $this->hasMany(ServiceGallery::class, 'services_id', 'id');
    }

    public function category()
    {
        return $this->belongsTo(ServiceCategory::class, 'categories_id', 'id');
    }
}

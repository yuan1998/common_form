<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BaseCommonForm extends Model
{
    protected $fillable = [
        'title',
        'name',
        'phone',
        'other_data',
    ];

    protected $casts = [
        'other_data' => 'json'
    ];
}

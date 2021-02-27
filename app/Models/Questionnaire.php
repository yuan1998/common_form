<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Questionnaire extends Model
{
    protected $fillable = [
        'name',
        'phone',
        'gender',
        'comment',
        'images',
        'other_question',
        'hospital',
    ];

    protected $casts = [
        'images'         => 'json',
        'other_question' => 'json',
    ];
}

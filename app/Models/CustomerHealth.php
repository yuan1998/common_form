<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CustomerHealth extends Model
{

    protected $fillable =[
        "name",
        "phone",
        "sex",
        "id_card",
        "body_temperature",
        "question_data",
    ];

    protected $casts =[
        "question_data" => "json"
    ];


}

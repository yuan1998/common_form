<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CustomerHealth extends Model
{

    public static $sexDetailList = [
        0 => '未知',
        1 => '男',
        2 => '女',

    ];

    protected $fillable = [
        "name",
        "phone",
        "sex",
        "id_card",
        "body_temperature",
        "question_data",
    ];

    protected $casts = [
        "question_data" => "json"
    ];


}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TT_TestForm extends Model
{
    protected $fillable = [
        "name",
        "phone",
        "channel",
        "question_data",
    ];

    protected $casts = [
        "question_data" => "json"
    ];


    static public $channelList = [
        'toutiao' => '头条',
        'oppo'    => 'OPPO',
    ];

}

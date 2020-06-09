<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class XXlBaseForm extends Model
{
    protected $table = 't_t__test_forms';

    protected $fillable = [
        "name",
        "phone",
        "channel",
        "question_data",
        'url',
    ];

    protected $casts = [
        "question_data" => "json"
    ];


    static public $channelList = [
        'toutiao' => '头条',
        'oppo'    => 'OPPO',
    ];

}

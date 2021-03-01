<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserGroup extends Model
{

    public function users()
    {
        return $this->belongsToMany(Administrator::class, 'groups_has_user', 'group_id', 'user_id');
    }
}

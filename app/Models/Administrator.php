<?php

namespace App\Models;


class Administrator extends \Encore\Admin\Auth\Database\Administrator
{
    public function baseForm()
    {
        return $this->belongsToMany(XXlBaseForm::class, 'admin_user_has_test_form', 'user_id', 'form_id');
    }
}

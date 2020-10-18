<?php

namespace App\Http\Controllers;

use App\Models\BaseCommonForm;
use Illuminate\Http\Request;

class BaseCommonFormController extends Controller
{
    public function store(Request $request)
    {
        $data = $request->only(['title', 'name', 'phone', 'other_data', 'url']);

        BaseCommonForm::create($data);

        return response()->json([
            'status' => 1,
            'msg'    => '创建成功'
        ]);
    }
}

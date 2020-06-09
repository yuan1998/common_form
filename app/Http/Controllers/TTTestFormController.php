<?php

namespace App\Http\Controllers;

use App\Models\XXlBaseForm;
use Illuminate\Http\Request;

class TTTestFormController extends Controller
{
    public function store(Request $request)
    {
        $data = $request->only(['name', 'phone', 'channel', 'question_data','url']);

        $item = XXlBaseForm::create($data);

        return response()->json([
            'status' => 1,
            'msg'    => '创建成功'
        ]);
    }


}

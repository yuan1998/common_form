<?php

namespace App\Http\Controllers;

use App\Http\Requests\CustomerHealthStoreRequest;
use App\Models\CustomerHealth;
use Illuminate\Http\Request;

class CustomerHealthController extends Controller
{

    public function store(CustomerHealthStoreRequest $request)
    {
        $data = $request->all();

        CustomerHealth::create($data);

        return response()->json([
            'status' => 1,
            'msg'    => '创建成功'
        ]);
    }

}

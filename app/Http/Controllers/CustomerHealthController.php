<?php

namespace App\Http\Controllers;

use App\Http\Requests\CustomerHealthStoreRequest;
use Illuminate\Http\Request;

class CustomerHealthController extends Controller
{

    public function store(CustomerHealthStoreRequest $request)
    {
        $data = $request->all();
        dd($data);

    }


}

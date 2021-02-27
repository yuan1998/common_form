<?php

namespace App\Http\Controllers;

use App\Http\Requests\QuestionStoreRequest;
use App\Models\Questionnaire;
use Illuminate\Http\Request;

class QuestionnaireController extends Controller
{
    public function store(QuestionStoreRequest $request)
    {
        $data   = $request->only([
            'name',
            'phone',
            'gender',
            'comment',
            'images',
            'other_question',
        ]);
        $result = Questionnaire::create($data);
        return response()->json([
            'status' => 1,
            'result' => $result
        ]);
    }
}

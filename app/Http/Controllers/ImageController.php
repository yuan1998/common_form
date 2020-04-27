<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ImageController extends Controller
{


    public function uploadImage(Request $request)
    {
        if ($request->hasFile('image')) {
            $image = $request->file('image');

            $todayString = Carbon::today()->toDateString();
            $path        = 'selfTestPhoto/' . $todayString;

            $result = Storage::disk('public')->put($path, $image, "public");

            $url = Storage::disk('public')->url($result);

            return response()->json([
                'status' => 1,
                'key'    => $result,
                'url'    => $url,
            ]);
        }

        return response()->json([
            'status' => 0,
            'msg'    => 'Request File Not Exists.'
        ]);
    }


}

<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::prefix('tt')->group(function () {
    Route::prefix('test-form')->group(function () {
        Route::post('/', "TTTestFormController@store");
    });
    
});


Route::prefix('base-image')->group(function () {
    Route::post('/upload', "ImageController@uploadImage");
});
Route::prefix('customer-health')->group(function () {
    Route::post('/', "CustomerHealthController@store");
});


Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

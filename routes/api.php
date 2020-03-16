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

Route::prefix('customer-health')->group(function () {
    Route::post('/', "CustomerHealthController@store");
    Route::get('version', function() {
        abort(403, 'test');
        return 'this is version v1';
    })->name('version');

});


Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

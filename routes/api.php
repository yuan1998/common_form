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

Route::prefix('common-form')->group(function () {
    Route::post('/', "BaseCommonFormController@store");
});
Route::prefix('wechat-jssdk')->group(function () {
    Route::get('jssdkConfigBuilder', "WechatAuthController@jssdkConfigBuilder");
});


Route::prefix('base-image')->group(function () {
    Route::post('/upload', "ImageController@uploadImage");
});
Route::prefix('customer-health')->group(function () {
    Route::post('/', "CustomerHealthController@store");
});

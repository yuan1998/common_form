<?php

use App\Admin\Controllers\CustomerHealthController;
use Illuminate\Routing\Router;

Admin::routes();

Route::group([
    'prefix'     => config('admin.route.prefix'),
    'namespace'  => config('admin.route.namespace'),
    'middleware' => config('admin.route.middleware'),
], function (Router $router) {

    $router->get('/', 'HomeController@index')->name('admin.home');

    $router->resource('customer-healths', "CustomerHealthController");
    $router->resource('tt_test-forms', XXlBaseFormController::class);
    $router->resource('base-common-forms', BaseCommonFormController::class);
    $router->resource('questionnaires', QuestionnaireController::class);
});

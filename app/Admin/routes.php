<?php

use Illuminate\Routing\Router;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
    'as'            => config('admin.route.prefix') . '.',
], function (Router $router) {

    $router->get('/', 'HomeController@index')->name('home');

    $router->resource('packages', PackageController::class);

    $router->resource('counpons', CounponController::class);
    $router->resource('counpon-codes', CounponCodeController::class);
    $router->resource('user-counpons', UserCounponController::class);

    $router->resource('user-orders', UserOrderController::class);

    $router->resource('user-packages', UserPackageController::class);

    $router->resource('users-domains', UserDomainController::class);

    $router->resource('users-domains-records', UsersDomainRecordController::class);

});

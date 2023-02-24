<?php

use Illuminate\Support\Facades\Route;

Route::post('login', 'Api\Auth\LoginController@login');
Route::namespace('Api')->middleware('auth:sanctum')->group(function () {
    Route::namespace('Auth')->group(function () {
        Route::get('profile', 'LoginController@profile');
        Route::post('logout', 'LoginController@logout');
    });

    Route::namespace('Rep')->group(function () {
        Route::controller('GeneralListController')->group(function () {
            Route::get('settings', 'settings');
            Route::get('list-prices', 'prices');
            Route::get('item-prices', 'itemsPrices');
            Route::get('item-types', 'itemTypes');
            Route::get('cities', 'cities');
        });

        Route::apiResource('units', 'UnitController');
        Route::get('bills/adds', 'BillControler@additions');

        Route::apiResource('items', 'ItemController');

        Route::controller('BackBillController')->group(function() {
            Route::get('back-bills', 'index');
            Route::post('back-bills', 'store');
            Route::get('back-bills/{id}', 'show');
        });
    });
});


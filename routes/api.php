<?php

use Illuminate\Support\Facades\Route;

Route::post('login', 'Api\Auth\LoginController@login');
Route::namespace('Api')->middleware('auth:sanctum')->group(function () {
    Route::controller('UserController')->namespace('Auth')->group(function () {
        Route::get('profile', 'profile');
        Route::post('logout', 'logout');
        Route::post('refresh', 'refresh');
    });

    Route::namespace('Rep')->group(function () {
        Route::controller('GeneralListController')->group(function () {
            Route::get('settings', 'settings');
            Route::get('list-prices', 'prices');
            Route::get('item-prices', 'itemsPrices');
            Route::get('cities', 'cities');
            Route::get('clients-groups', 'clientsGroups');
        });

        Route::controller('InvoiceController')->group(function () {
            Route::get('invoices/sales', 'sales');
            Route::get('invoices/back-sales', 'backSales');
            Route::get('invoices/purchases', 'purchases');
            Route::get('invoices/back-purchases', 'backPurchases');
            Route::get('invoices/additions', 'additions');
        });


        Route::apiResource('item-types', 'ItemTypeController');

        Route::apiResource('units', 'UnitController');

        Route::apiResource('locations', 'LocationController');

        Route::apiResource('items', 'ItemController');

        Route::post('client/receipts', 'ClientReceiptController@store');
        Route::get('client/{client_id}/receipts', 'ClientReceiptController@index');
        Route::apiResource('clients', 'ClientController');

        Route::controller('BackBillController')->group(function() {
            Route::get('back-bills', 'index');
            Route::post('back-bills', 'store');
            Route::get('back-bills/{id}', 'show');
        });
    });
});


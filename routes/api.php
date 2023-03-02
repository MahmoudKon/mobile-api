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
        // Route::apiResource('units', 'UnitController');
        Route::controller('UnitController')->group(function () {
            Route::get('units', 'index');
            Route::post('add-unit', 'store');
            Route::get('edit-unit/{unit}', 'show');
            Route::post('update-unit/{unit}', 'update');
            Route::post('delete-unit/{unit}', 'destroy');
        });

        // Route::apiResource('categories', 'ItemTypeController');
        Route::controller('ItemTypeController')->group(function () {
            Route::get('categories', 'index');
            Route::post('add-category', 'store');
            Route::get('edit-category/{item_type}', 'show');
            Route::post('update-category/{item_type}', 'update');
            Route::post('delete-category/{item_type}', 'destroy');
        });

        // Route::apiResource('locations', 'LocationController');
        Route::controller('LocationController')->group(function () {
            Route::get('locations', 'index');
            Route::post('new-location', 'store');
        });

        Route::controller('GeneralListController')->group(function () {
            Route::get('settings', 'settings');
            Route::get('lists', 'prices');
            Route::get('cities', 'cities');
            Route::get('sale-points', 'salePoints');
        });

        // Route::apiResource('items', 'ItemController');
        Route::controller('ItemController')->group(function () {
            Route::get('items-prices', 'itemsPrices');
            Route::get('items', 'index');
            Route::get('items2', 'items2');

        });


        Route::controller('InvoiceController')->group(function () {
            Route::get('invoices/sales', 'sales');
            Route::get('invoices/back-sales', 'backSales');
            Route::get('invoices/purchases', 'purchases');
            Route::get('invoices/back-purchases', 'backPurchases');
            Route::get('invoices/{id}', 'show');
            Route::get('invoices/additions', 'additions');
        });


        Route::get('expenses-terms', 'SpendController@index');
        Route::post('new-expenses', 'SpendController@store');

        Route::get('balance-sheet/{client}', 'ClientReceiptController@index');
        Route::post('new-receipt', 'ClientReceiptController@store');
        // Route::apiResource('clients', 'ClientController');
        Route::controller('ClientController')->group(function () {
            Route::get('clients', 'index');
            Route::post('add-client', 'store');
            Route::get('clients/{client}', 'show');
            Route::post('clients/{client}', 'update');
            Route::get('clients-group', 'clientsGroups');
        });
        

        Route::get('point-money-day', 'ReportController@index');

        Route::controller('BackBillController')->group(function() {
            Route::get('back-bills', 'index');
            Route::post('back-bills', 'store');
            Route::get('back-bills/{id}', 'show');
        });
    });
});


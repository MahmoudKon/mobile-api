<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});






// <?php

// /*
// |--------------------------------------------------------------------------
// | Application Routes
// |--------------------------------------------------------------------------
// |
// | Here is where you can register all of the routes for an application.
// | It's a breeze. Simply tell Laravel the URIs it should respond to
// | and give it the controller to call when that URI is requested.
// |
// */
// //        Route::post('add-client', 'Rep\ClientController@store');



// Route::get('/', function () {
//     $databaseName = \DB::connection()->getDatabaseName();


//     dd($databaseName);

//     dd('email');

// //    // return view('welcome');
// //
// //    return Request::url();
// });

// Route::group(['prefix' => 'api/v1'], function () {
// //    Route::post('login', function () {
// //        dd('email');
// //   });
//     Route::post('login', 'Rep\AuthController@login');
//     Route::group(['middleware' => 'auth:rep'], function () {
//         Route::get('units', 'Rep\UnitController@index');                         DONE
//         Route::post('add-unit', 'Rep\UnitController@store');                     DONE
//         Route::get('edit-unit/{id}', 'Rep\UnitController@edit');                 DONE
//         Route::post('update-unit/{id}', 'Rep\UnitController@update');            DONE
//         Route::post('delete-unit/{id}', 'Rep\UnitController@destroy');           DONE
//         Route::get('categories', 'Rep\CategoryController@index');                DONE
//         Route::post('add-category', 'Rep\CategoryController@store');             DONE
//         Route::get('edit-category/{id}', 'Rep\CategoryController@edit');         DONE
//         Route::post('update-category/{id}', 'Rep\CategoryController@update');    DONE
//         Route::post('delete-category/{id}', 'Rep\CategoryController@destroy');   DONE
//         Route::get('cities', 'Rep\CityController@index');                        DONE
//         Route::get('sale-points', 'Rep\SalePointController@index');              DONE
//         Route::get('settings', 'Rep\SettingController@settings');                DONE
//         Route::get('lists', 'Rep\SettingController@lists');                      DONE
//         Route::get('locations', 'Rep\LocationController@index');                 DONE
//         Route::post('new-location', 'Rep\LocationController@store');             DONE
//         Route::get('expenses-terms', 'Rep\SpendController@spendItems');          DONE
//         Route::post('new-expenses', 'Rep\SpendController@store');                DONE
//         Route::get('items-prices', 'Rep\ItemController@itemsPrices');            DONE
//         Route::get('items', 'Rep\ItemController@index');                         DONE
//         Route::get('items2', 'Rep\ItemController@items');                        DONE
//         Route::post('sales', 'Rep\SaleProcessController@index');                 DONE
//         Route::get('bill-add', 'Rep\BillController@billAdd');                    DONE
//         Route::get('backs', 'Rep\BackBillController@index');                     DONE
//         Route::get('backs', 'Rep\BackBillController@bills');                     DONE
//         Route::post('bill-details', 'Rep\BillController@billDetails');           DONE  => make it get method and make bill id in url
//         Route::get('back-bill-details', 'Rep\BackBillController@billDetails');   DONE
//         Route::post('point-money-day', 'Rep\ReportController@pointMoneyDay');    DONE




//         Route::post('new-bill', 'Rep\BillController@newBill');
//         Route::post('new-back-bill', 'Rep\BackBillController@newBackBill');


//         Route::get('clients', 'Rep\ClientController@index');
//         Route::post('new-receipt', 'Rep\ClientController@receipts');
//         Route::get('balance-sheet', 'Rep\ClientController@balanceSheet');
//         Route::post('add-client', 'Rep\ClientController@store');
//         Route::post('clients-group', 'Rep\ClientController@clientsGroup');
        
//         Route::post('/clients/{id}', 'Rep\ClientController@update');
        
//         Route::group(['middleware' => 'lines'], function () {
//             // Route::post('/lines/create', 'Rep\LineController@store');
//             Route::get('/lines/clients', 'Rep\ClientController@getLineClients');
//             // Route::post('/lines/clients', 'Rep\ClientController@updateLineClients');
//             // Route::post('/lines/clients/exceptional_visitation', 'Rep\ClientVisitController@store');
//         });

//         Route::get('clients/{id}/balance-sheet-excel', 'Rep\ClientController@balanceSheetExcel');

//     });
        

// });
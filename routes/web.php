<?php

use App\Http\Controllers\DashboardController;
use App\Http\Controllers\ServiceCategoryController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });

// Route::middleware([
//     'auth:sanctum',
//     config('jetstream.auth_session'),
//     'verified'
// ])->group(function () {
//     Route::get('/dashboard', function () {
//         return view('dashboard');
//     })->name('dashboard');
// });

Route::group(['middleware' => ['auth:sanctum', 'verified']], function () {

    Route::name('dashboard.')->prefix('dashboard')->group(function () {
        Route::get('/', [DashboardController::class, 'index'])->name('index');

        Route::middleware(['admin'])->group(function () {
            // Route::resource('product', ProductController::class);
            Route::resource('category', ServiceCategoryController::class);
            // Route::resource('product.gallery', ProductGalleryController::class)->shallow()->only([
            //     'index', 'create', 'store', 'destroy'
            // ]);
            // Route::resource('transaction', TransactionController::class)->only([
            //     'index', 'show', 'edit', 'update'
            // ]);
            // Route::resource('user', UserController::class)->only([
            //     'index', 'edit', 'update', 'destroy'
            // ]);
        });
    });
});

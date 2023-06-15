<?php

namespace App\Http\Controllers\API;

use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;
use App\Models\Transaction;
use App\Models\TransactionItem;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class TransactionController extends Controller
{

    public function all(Request $request)
    {
        $id = $request->input('id');
        $limit = $request->input('limit', 6);
        $status = $request->input('status');

        if ($id) {
            $transaction = Transaction::with(['items.service'])->find($id);

            if ($transaction) {
                return ResponseFormatter::success(
                    $transaction,
                    'Data transaksi berhasil diambil'
                );
            } else {
                return ResponseFormatter::error(
                    null,
                    'Data transaksi tidak ada '
                );
            }
        }

        $transaction = Transaction::with(['items.service'])->where('user_id', Auth::user()->id);

        if ($status) {
            $transaction->where('status', $status);
        }

        return ResponseFormatter::success(
            $transaction->paginate($limit),
            'Data list transaksi berhasil diambil',
        );
    }

    public function getLeastBusyTherapist()
    {
        if (Transaction::count() == 0) {
            return User::where('roles', '=', 'therapist')->first();
        } else {
            $joblessTherapists = User::whereNotIn('id', Transaction::select('therapist_id'))
                ->where('roles', '=', 'therapist')
                ->get();

            if ($joblessTherapists->count() == 0) {
                $leastBusyTherapist = User::join('transactions', 'users.id', '=', 'transactions.therapist_id')
                    ->select('users.id', DB::raw('COUNT(transactions.therapist_id) as jobcount'))
                    ->groupBy('users.id')
                    ->orderBy('jobcount', 'asc')
                    ->first();

                return User::where('id', '=', $leastBusyTherapist->id)->first();
            } else {
                return $joblessTherapists->first();
            }
        }
    }

    public function checkout(Request $request)
    {
        $request->validate([
            'items' => 'required|array',
            'items.*.id' => 'exists:services,id',
            'therapist_id' => 'nullable',
            'total_price' => 'required',
            'extra_price' => 'required',
            'status' => 'required|in:PENDING,SUCCESS,CANCELLED,FAILED'
        ]);

        try {
            $user = Auth::user();
            if ($user->roles != "therapist") {
                $therapistId = $this->getLeastBusyTherapist()->id;
                $userId = $user->id;
                $transaction = Transaction::create([
                    'user_id' => $userId,
                    'therapist_id' => $therapistId,
                    'address' => $request->address,
                    'total_price' => $request->total_price,
                    'extra_price' => $request->extra_price,
                    'status' => $request->status
                ]);

                foreach ($request->items as $service) {
                    TransactionItem::create([
                        'users_id' => Auth::user()->id,
                        'services_id' => $service['id'],
                        'transactions_id' => $transaction->id,
                        'quantity' => $service['quantity'],
                    ]);
                }

                $transaction = Transaction::where('user_id', $userId)->first();
                return ResponseFormatter::success($transaction->load('items.service'), 'Transaksi berhasil');
            } else {
                return ResponseFormatter::error(null, "Therapists cannot create transactions.");
            }
        } catch (Exception $err) {
            return ResponseFormatter::error([
                'message' => 'Something went wrong',
                'error' => $err
            ], 'Server Error', 500);
        }
    }
}

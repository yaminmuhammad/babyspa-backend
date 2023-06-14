<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('transactions', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('therapist_id');
            $table->bigInteger('user_id');
            $table->text('address')->nullable();
            $table->float('total_price')->default(0);
            $table->float('extra_price')->default(0);
            $table->string('status')->default('PENDING');
            $table->string('payment')->default('MANUAL');
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('transactions');
    }
};

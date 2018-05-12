<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserWarning extends Model
{
    protected $table = 'user_warnings';

    protected $fillable = [
        'user_id',
        'warned_by',
        'reason',
        'type',
        'active',
        'expiry'
    ];

    protected $dates = [
        'created_at',
        'updated_at'
    ];
}
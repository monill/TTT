<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Guest extends Model
{
    protected $table = 'guests';
    
    protected $fillable = [
        'ip',
        'country',
        'city',
        'estate',
        'os_system',
        'browser',
        'referrer',
        'has_returned',
        'access'
    ];

    protected $dates = [
        'created_at',
        'updated_at'
    ];
}
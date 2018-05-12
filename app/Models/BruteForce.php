<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BruteForce extends Model
{
    protected $table = 'brute_forces';

    protected $fillable = [
        'ip',
        'times',
        'whenin'
    ];
    
    public $timestamps = false;
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserActivation extends Model
{
    protected $table = 'user_activations';

    protected $fillable = [
        'user_id',
        'hash',
        'active'
    ];

    protected $dates = [
        'created_at',
        'actived_at'
    ];

    public $timestamps = false;
}
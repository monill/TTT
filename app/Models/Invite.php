<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Invite extends Model
{
    protected $table = 'invites';
    
    protected $fillable = [
        'email',
        'hash',
        'expires_on',
        'invited_by',
        'accepted_by',
        'accepted_at'
    ];

    protected $dates = [
        'created_at',
        'updated_at'
    ];
}

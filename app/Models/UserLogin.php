<?php


namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserLogin extends Model
{
    protected $table = 'user_logins';

    protected $fillable = [
        'user_id',
        'ip',
        'browser',
        'os_system'
    ];

    protected $dates = [
        'created_at',
        'updated_at'
    ];

}
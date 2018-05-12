<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Pagination\Paginator;

class User extends Model
{
    protected $table = 'users';

    protected $fillable = [
        'email',
        'passwd',
        'username',
        'status',
        'profile',
        'class',
        'downloaded',
        'uploaded',
        'passkey',
        'invites',
        'dob',
        'info',
        'signature',
        'avatar',
        'title',
        'sex',
        'donated',
        'country_id',
        'points',
        'social_facebook',
        'social_twitter',
        'social_gplus',
        'social_linkedin',
        'social_instagram',
        'social_pinterest'
    ];

    protected $hidden = [
        'passwd', 'passkey'
    ];

    protected $dates = [
        'created_at',
        'updated_at'
    ];

    public static function members()
    {
        return User::where('status', '=', 'confirmed')
            ->where('profile', '!=', 'private')
            ->where('class', '!=', 'boos')
            ->get();
    }

    public static function classes($class)
    {
        if ($class == "member") {
            return '<span class="badge badge-primary">Member</span>';
        } elseif ($class == "memberplus") {
            return '<span class="badge badge-secondary">Member Plus</span>';
        } elseif ($class == "vip") {
            return '<span class="badge badge-success">VIP</span>';
        } elseif ($class == "uploader") {
            return '<span class="badge badge-danger">Uploader</span>';
        } elseif ($class == "moderator") {
            return '<span class="badge badge-warning">Moderator</span>';
        } elseif ($class == "moderatorplus") {
            return '<span class="badge badge-info">Moderator Plus</span>';
        } elseif ($class == "admin") {
            return '<span class="badge badge-light">Admin</span>';
        } elseif ($class == "boss") {
            return '<span class="badge badge-dark">Boss</span>';
        } else {
            return "Undefined";
        }
    }
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TorrentRating extends Model
{
    protected $table = 'torrent_ratings';

    protected $fillable = [
        'torrent_id',
        'user_id',
        'rating'
    ];

    protected $dates = [
        'created_at',
        'updated_at'
    ];

}

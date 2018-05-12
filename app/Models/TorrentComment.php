<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TorrentComment extends Model
{
    protected $table = 'torrent_comments';

    protected $fillable = [
        'torrent_id',
        'user_id',
        'comment'
    ];

    protected $dates = [
        'created_at',
        'updated_at'
    ];

}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TorrentComplete extends Model
{
    protected $table = 'torrent_completes';

    protected $fillable = [
        'torrent_id',
        'user_id',
    ];

    protected $dates = [
        'created_at'
    ];

    public $timestamps = false;

}

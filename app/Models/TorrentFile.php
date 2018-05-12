<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TorrentFile extends Model
{
    protected $table = 'torrent_files';

    protected $fillable = [
        'torrent_id',
        'length',
        'path'
    ];

    protected $dates = [
        'created_at',
        'updated_at'
    ];

}

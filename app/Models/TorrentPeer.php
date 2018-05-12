<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TorrentPeer extends Model
{
    protected $table = 'torrent_peers';

    protected $fillable = [
        'torrent_id',
        'peer_id',
        'ip',
        'port',
        'uploaded',
        'downloaded',
        'to_go',
        'seeder',
        'connectable',
        'client',
        'user_id',
        'passkey',
        'started',
        'lastaction'
    ];

    public $timestamps = false;

}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TorrentCategory extends Model
{
    protected $table = 'torrent_categories';

    protected $fillable = [
        'name',
        'slug',
        'icon'
    ];

    public $timestamps = false;

}

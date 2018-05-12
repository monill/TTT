<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Torrent extends Model
{
    protected $table = 'torrents';

    protected $fillable = [
        'info_hash',
        'name',
        'filename',
        'poster',
        'image1',
        'image2',
        'image3',
        'announce',
        'description',
        'category_id',
        'size',
        'numfiles',
        'views',
        'comments',
        'downs',
        'times_completed',
        'leechers',
        'seeders',
        'thanks',
        'uploader_id',
        'visible',
        'banned',
        'anon',
        'nfo',
        'freeleech'
    ];

    protected $dates = [
        'created_at',
        'updated_at'
    ];

}

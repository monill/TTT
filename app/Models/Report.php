<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Report extends Model
{
    protected $table = 'reports';

    protected $fillable = [
        'report_by',
        'link_id',
        'type',
        'reason',
        'dealt_by',
        'solution',
        'solved'
    ];

    protected $dates = [
        'created_at',
        'updated_at'
    ];
}
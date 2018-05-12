<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Faq extends Model
{
    protected $table = 'faqs';

    protected $fillable = [
        'question',
        'category_id',
        'style',
        'answer'
    ];

    protected $dates = [
        'created_at',
        'updated_at'
    ];

}

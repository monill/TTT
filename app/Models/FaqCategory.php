<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FaqCategory extends Model
{
    protected $table = 'faq_categories';

    protected $fillable = [
        'name',
        'style'
    ];

    protected $dates = [
        'created_at',
        'updated_at'
    ];

}

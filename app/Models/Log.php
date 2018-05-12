<?php


namespace App\Models;

use App\Libs\BrowserDetection;
use App\Libs\Helper;
use Illuminate\Database\Eloquent\Model;

class Log extends Model
{
    protected $table = 'logs';

    protected $fillable = [
        'user_id',
        'message',
        'ip',
        'browser',
        'os_system'
    ];

    protected $dates = [
        'created_at',
        'updated_at'
    ];

    public static function novo(int $user_id, string $text)
    {
        $browser = new BrowserDetection();

        $newlog = new Log();
        $newlog->user_id = $user_id;
        $newlog->message = $text;
        $newlog->ip = Helper::getIP();
        $newlog->browser = $browser->getName();
        $newlog->os_system = $browser->getPlatformVersion();
        $newlog->created_at = Helper::dateTime();
        $newlog->save();
    }
}
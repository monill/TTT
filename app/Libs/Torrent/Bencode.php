<?php

namespace App\Libs\Torrent;

class Bencode
{
    public static function encode($encode)
    {
        return Encode::encode($encode);
    }

    public static function decode($decode)
    {
        return Decode::decodeFile($decode);
    }

}

<?php

namespace App\Libs\Torrent;

use Exception;

class Encode
{
    private $params = [
        // Set to true to encode empty arrays as dictionaries ("de") instead of lists ("le")
       'encodeEmptyArrayAsDictionary' => false,
    ];

    public function __construct(array $params = array())
    {
        $this->params = array_replace($this->params, $params);
    }

    public function setParam($key, $value)
    {
        return $this->params[$key] = $value;
    }

    public function encode($value)
    {
        if ($this->isInteger($value)) {
            return $this->encodeInteger($value);
        } elseif (is_string($value)) {
            return $this->encodeString($value);
        } elseif (is_array($value)) {
            $size = count($value);

            if (!$size && $this->params['encodeEmptyArrayAsDictionary']) {
                return $this->encodeDictionary($value);
            }

            for ($i=0; $i < $size; $i++) {
                if (!isset($value[$i])) {
                    return $this->encodeDictionary($value);
                }
            }
            return $this->encodeList($value);
        }
        throw new \Exception("Variables of type " . gettype($value) . " can not be encoded.");
    }

    public function encodeInteger($integer)
    {
        if ($this->isInteger($integer)) {
            return 'i' . $integer . 'e';
        }
        throw new \Exception("Expected an integer.");

    }

    public function encodeString($string)
    {
        if (!is_string($string)) {
            throw new \Exception("Expected array, got: " . gettype($string) . ".");
        }
        return strlen($string) . ':' . $string;
    }

    public function encodeList($list)
    {
        if (!is_array($list)) {
            throw new \Exception("Expected array, got: " . gettype($list) . ".");
        }

        $ret = 'l';

        foreach ($list as $value) {
            $ret .= $this->encode($value);
        }
        return $ret . 'e';
    }

    public function encodeDictionary($dictionary)
    {
        if (!is_array($dictionary)) {
            throw new \Exception("Expected array, got: " . gettype($dictionary) . ".");
        }

        ksort($dictionary);

        $ret = 'd';

        foreach ($dictionary as $left => $right) {
            $ret .= $this->encodeString($left) . $this->encode($right);
        }
        return $ret . 'e';
    }

    private function isInteger($value)
    {
        return is_int($value) || (PHP_INT_SIZE === 4 && is_numeric($value) && (strpos($var, '.') === false));
    }
}

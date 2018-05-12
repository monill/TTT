<?php

namespace App\Libs\Torrent;

class FileInfo
{
    private $name;
    private $type;
    private $tmp_name;
    private $error = 0;
    private $size;

    public function __construct($file)
    {
        $this->setName($file['name']);
        $this->setType($file['type']);
        $this->setTmpName($file['tmp_name']);
        $this->setError($file['error']);
        $this->setSize($file['size']);
    }

    /**
     * @return mixed
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * @param mixed $name
     */
    public function setName($name)
    {
        $this->name = trim($name);
    }

    /**
     * @return mixed
     */
    public function getType()
    {
        return $this->type;
    }

    /**
     * @param mixed $type
     */
    public function setType($type)
    {
        $this->type = $type;
    }

    /**
     * @return mixed
     */
    public function getTmpName()
    {
        return $this->tmp_name;
    }

    /**
     * @param mixed $tmp_name
     */
    public function setTmpName($tmp_name)
    {
        $this->tmp_name = $tmp_name;
    }

    /**
     * @return int
     */
    public function getError(): int
    {
        return $this->error;
    }

    /**
     * @param int $error
     */
    public function setError(int $error)
    {
        $this->error = $error;
    }

    /**
     * @return mixed
     */
    public function getSize()
    {
        return $this->size;
    }

    /**
     * @param mixed $size
     */
    public function setSize($size)
    {
        $this->size = $size;
    }

    public function remove()
    {
        return unlink($this->tmp_name);
    }

    public function move($path)
    {
        return move_uploaded_file($this->tmp_name, $path);
    }




}
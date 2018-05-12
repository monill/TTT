<?php

namespace App\Controllers;

use App\Libs\Input;
use App\Libs\Redirect;
use App\Libs\Token;
use App\Libs\Torrent\FileInfo;
use App\Libs\Validation;
use App\Models\Torrent as Tor;

class Torrent extends Controller
{
    private $valid;

    public function __construct()
    {
        parent::__construct();
        if (!$this->loggedIn()) {
            Redirect::to('/login');
        }
        $this->valid = new Validation();
    }

    public function index($id = null)
    {
        echo "<br>" . $id;
        //Redirect::to('/torrents');
    }

    public function view($id)
    {
        $torrent = Tor::find($id);

        if (!$torrent) {
            Redirect::to('/error');
        }

        $this->view('torrents/torrent', [
            'torrent' => $torrent
        ]);
    }

    public function upload()
    {
        if (Input::exist())
        {
            if (!Token::check(Input::get('token')))
            {
                // $torrent = $_FILES['torrent'];
                // $nfo = '';
                // $name = Input::get('name');
                // $poster = Input::get('poster');
                // $image1 = Input::get('image1');
                // $image2 = Input::get('image2');
                // $image3 = Input::get('image3');
                // $category_id = Input::get('category');
                // $uploader = Input::get('showuploader');
                // $description = Input::get('description');



                //echo print_r($_POST);
                //$file = TFOLDER . '001.torrent';

                //$a = \Rych\Bencode\Bencode::decode($file);

                //print_r($a);

                //$torrent = new \App\Libs\Torrent($torrent['tmp_name']);

//                echo '<br>private: ', $torrent->is_private() ? 'yes' : 'no',
//                    '<br>annonce: ', $torrent->announce(),
//                    '<br>name: ', $torrent->name(),
//                    '<br>comment: ', $torrent->comment(),
//                    '<br>piece_length: ', $torrent->piece_length(),
//                    '<br>size: ', $torrent->size( 2 ),
//                    '<br>hash info: ', $torrent->hash_info(),
//                    '<br>stats: ';
//
//
//                if ($errors = $torrent->errors()) {
//                    if (count($errors) > 0) {
//                        echo 'Error';
//                    }
//                }

                // $errors = $this->validUpload($torrent, $description);

            } else {
                echo 'Invalid token';
            }
        } else {
            Redirect::to('/torrents/upload');
        }

    }

    public function validUpload($file, $desc)
    {
        $errors = array();

        if ($this->valid->isEmpty($desc)) {
            $errors[] = "Description cant be empty";
        }

        $filer = new FileInfo($file);

        if (!preg_match("/^(.+)\.torrent$/si", $filer->getName())) {
            $errors[] = "Invalid filename not (.torrent).";
        }

        if ($filer->getType() !== 'application/x-bittorrent') {
            $errors[] = "Invalid file extension, this is not a torrent file.";
        }

        if ($filer->getError() > 0) {
            $errors[] = "Error found on file, error: " . $filer->getError();
        }

        return $errors;
    }

    public function download($id)
    {
//        $vai->announce(false);
//        $vai->comment('Testing');
//        $vai->announce(ANNOUNCE . '/' . 'dajshdjkashdqiwiue');
//
//        $vai->send();
    }

    public function edit($id)
    {
        $torrent = Tor::find($id);

        if (!$torrent) {
            Redirect::to('/error');
        }

        $this->view('torrents/edit', [
            'torrent' => $torrent
        ]);
    }

    public function delete($id)
    {

    }
}

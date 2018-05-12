<?php

namespace App\Controllers;

use App\Libs\Input;
use App\Libs\Redirect;
use App\Libs\Token;
use App\Models\Torrent;
use App\Models\TorrentCategory;

class Torrents extends Controller
{
    public function __construct()
    {
        parent::__construct();
        if (!$this->loggedIn()) {
            Redirect::to('/login');
        }
    }

    public function index()
    {
        $this->view('torrents/index', [
            'torrents' => Torrent::all(),
            'categories' => TorrentCategory::all()
        ]);
    }

    public function category($id)
    {
        $torrents = Torrent::where('category_id', '=', $id)->get();

        $this->view('torrents/index', [
            'torrents' => $torrents,
            'categories' => TorrentCategory::all()
        ]);
    }

    public function upload()
    {
        $this->view('torrents/upload', [
            'categories' => TorrentCategory::all()
        ]);
    }

    public function import()
    {
        $dir = DATA . 'import/';
        $dh = opendir($dir);
        $files = array();
        while (($file = readdir($dh)) !== false) {
            if (preg_match("/^(.+)\.torrent$/si", $file)) {
                $files[] = $file;
            }
        }
        closedir($dh);

        $this->view('torrents/import', [
            'categories' => TorrentCategory::all(),
            'files' => $files
        ]);
    }

    public function search()
    {
        if (Input::exist())
        {
            if (!Token::check(Input::get('token')))
            {
                $search = Input::get('search');

                $torrents = Torrent::where('name', '=', "%$search%")->get();

                $this->view('torrents/index', [
                    'torrents' => $torrents,
                    'categories' => TorrentCategory::all()
                ]);
            } else {
                echo 'Invalid Token';
            }
        } else {
            Redirect::to('/torrents');
        }
    }

    public function completes($id = '')
    {
        //TODO
        //finish this
        echo $id . '<br>';
        $this->view->title = SNAME . " :: Torrent completes";
        //$this->view->torrents = $torrents;
        //$this->view->token = Token::generate();
        $this->view('torrents/completed', []);
    }

    public function reseed($id = '')
    {
        //TODO
        //finish this
        //send a notification to users to reseed a completed torrent
        echo $id . '<br>';
    }
}

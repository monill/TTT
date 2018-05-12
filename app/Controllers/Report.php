<?php

namespace App\Controllers;

use App\Libs\Helper;
use App\Libs\Input;
use App\Libs\Redirect;
use App\Libs\Session;
use App\Libs\Token;
use App\Models\User;
use App\Models\Log;
use App\Models\Report as Rep;
use App\Models\Torrent;
use App\Models\TorrentComment;

class Report extends Controller
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
        Redirect::to('/home');
    }

    public function comment($id = null)
    {
        if (Input::exist())
        {
            if (!Token::check(Input::get('token')))
            {
                $uid = Session::get('user_id');

                $reportT = new Rep();
                $reportT->report_by = $uid;
                $reportT->link_id = $id;
                $reportT->type = 'comment';
                $reportT->reason = Input::get('reason');
                $reportT->created_at = Helper::dateTime();
                $reportT->save();

                Log::novo($uid, "User reported a comment: {$id}");

                echo json_encode(['status' => 'success', 'msg' => 'Thank You For Reporting']);

                Redirect::to('/torrents');
            } else {
                echo 'Invalid Token';
            }
        } else {
            if ($id == null) {
                Redirect::to('/torrents');
            } else {
                $comment = TorrentComment::where('id', '=', $id)->first();
                if (!$comment) {
                    Redirect::to('/torrents');
                }
            }
        }

        $this->view('reports/comment', [
            'comment' => $comment
        ]);
    }

    public function topic($id = null)
    {
        if (Input::exist())
        {
            if (!Token::check(Input::get('token')))
            {
                $uid = Session::get('user_id');

                $reportT = new Rep();
                $reportT->report_by = $uid;
                $reportT->link_id = $id;
                $reportT->type = 'topic';
                $reportT->reason = Input::get('reason');
                $reportT->created_at = Helper::dateTime();
                $reportT->save();

                Log::novo($uid, "User reported the topic: {$id}");

                echo json_encode(['status' => 'success', 'msg' => 'Thank You For Reporting']);

                Redirect::to('/forum');
            } else {
                echo 'Invalid Token';
            }
        } else {
            if ($id == null) {
                Redirect::to('/forum');
            } else {
                //TODO
                //finish this class for forum-topic
                $topic = Torrent::where('id', '=', $id)->first();
                if (!$topic) {
                    Redirect::to('/forum');
                }
            }
        }

        $this->view('reports/topic', [
            'topic' => $topic
        ]);
    }

    public function torrent($id = null)
    {
        if (Input::exist())
        {
            if (!Token::check(Input::get('token')))
            {
                $uid = Session::get('user_id');

                $reportT = new Rep();
                $reportT->report_by = $uid;
                $reportT->link_id = $id;
                $reportT->type = 'torrent';
                $reportT->reason = Input::get('reason');
                $reportT->created_at = Helper::dateTime();
                $reportT->save();

                Log::novo($uid, "User reported the torrent: {$id}");

                echo json_encode(['status' => 'success', 'msg' => 'Thank You For Reporting']);

                Redirect::to('/torrents');
            } else {
                echo 'Invalid Token';
            }
        } else {
            if ($id == null) {
                Redirect::to('/torrents');
            } else {
                $torrent = Torrent::where('id', '=', $id)->first();
                if (!$torrent) {
                    Redirect::to('/torrents');
                }
            }
        }

        $this->view('reports/torrent', [
            'torrent' => $torrent
        ]);
    }

    public function user($id = null)
    {
        if (Input::exist())
        {
            if (!Token::check(Input::get('token')))
            {
                $uid = Session::get('user_id');

                $reportT = new Rep();
                $reportT->report_by = $uid;
                $reportT->link_id = $id;
                $reportT->type = 'user';
                $reportT->reason = Input::get('reason');
                $reportT->created_at = Helper::dateTime();
                $reportT->save();

                Log::novo($uid, "User reported a user: {$id}");

                echo json_encode(['status' => 'success', 'msg' => 'Thank You For Reporting']);

                Redirect::to('/home');
            } else {
                echo 'Invalid Token';
            }
        } else {
            if ($id == null) {
                Redirect::to('/home');
            } else {
                $use = User::where('id', '=', $id)->first();
                if (!$use) {
                    Redirect::to('/home');
                }
            }
        }

        $this->view('reports/user', [
            'use' => $use
        ]);
    }

}

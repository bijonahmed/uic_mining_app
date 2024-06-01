<?php

namespace App\Http\Controllers\Chat;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\MyMessage;
use Illuminate\Http\Request;
use App\Events\Message;


class ChatController extends Controller
{

    protected $userid;
    public function __construct()
    {
        $this->middleware('auth:api');
        $id = auth('api')->user();
        if (!empty($id)) {
            $user = User::find($id->id);
            $this->userid = $user->id;
        }
    }

    public function message(Request $request)
    {

        $data = $request->validate([
            'username' => 'required',
            'message' => 'required',
            'community_slug' => 'required',
        ]);

       //event(new Message($request->input('username'), $request->input('message')));
       event(new Message($data['username'], $data['message'], $data['community_slug']));

        $rdata['user_id']        = $this->userid;
        $rdata['community_slug'] = $request->community_slug;
        $rdata['message']        = $request->message;
        $message = MyMessage::insertGetId($rdata);

        return response()->json($message);
        //return [];
    }

    public function getMessages($community_slug)
    {
        $messages = MyMessage::where('community_slug', $community_slug)->get();
        return response()->json($messages);
    }
}
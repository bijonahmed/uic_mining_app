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
        $rdata['username']       = $request->username;
        $message = MyMessage::insertGetId($rdata);

        return response()->json($message);
        //return [];
    }

    public function getMessages($community_slug)
    {
        $messages = MyMessage::where('community_slug', $community_slug)->get();

        $data = [];
        foreach ($messages as $v) {
            $check = User::where('email',$v->username)->select('name')->first();
            $data[] = [
                'id'                => $v->id,
                'user_id'           => $v->user_id,
                'username'          => $v->username,
                'name'              => !empty($check) ? $check->name: "",
                'community_slug'    => $v->community_slug,
                'message'           => $v->message,
                'created_at'        => $v->created_at,
                'updated_at'        => $v->updated_at,
            ];
        }
        return response()->json($data, 200);
    }
}
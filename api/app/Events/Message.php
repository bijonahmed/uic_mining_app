<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;
use Carbon\Carbon;

class Message implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $username;
    public $message;
    public $community_slug;
    public $created_at;

    public function __construct(string $username, string $message, string $community_slug)
    {
        $this->username = $username;
        $this->message = $message;
        $this->community_slug = $community_slug;
        $this->created_at = Carbon::now()->toDateTimeString();
    }
     

    public function broadcastOn()
    {
        //return ['chat'];
        return new Channel('chat.' . $this->community_slug);
    }

    public function broadcastAs()
    {
        return 'message';
    }
}

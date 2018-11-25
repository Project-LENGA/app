class VideoChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from(video_chat_room)
    lesson = Lesson.find_by(id: params['lesson_id'])

    # mock use
    user = lesson.tutor

    if lesson.attendee?(user)
      message = <<-MSG
      Successfully connected to video chat.
      lesson_id: #{lesson.id}
      user_id: #{current_user.id}
      MSG
      ActionCable.server.broadcast(video_chat_room,
                                   action: 'message',
                                   message: message)
    else
      ActionCable.server.broadcast(video_chat_room,
                                   action: 'message',
                                  message: 'This room is not for you')
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def join_room data
    lesson = Lesson.find(params['lesson_id'])
    user = lesson.tutor

    if lesson.attendee?(user)
      ActionCable.server.broadcast(video_chat_room,
                                   action: 'join_room',
                                   peerId: data['peer_id'])
    else
      ActionCable.server.broadcast(video_chat_room,
                                  action: 'warn',
                                  message: 'Only attendees are allowed to access')
    end
  end

  private
    def video_chat_room
      "video_chat:#{params['lesson_id']}"
    end
end

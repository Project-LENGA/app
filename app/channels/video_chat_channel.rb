class VideoChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from(video_chat_room)
    lesson = Lesson.find(params['lesson_id'])

    if lesson.attendee?(current_user)
      message = <<-MSG
      Successfully connected to video chat.
      lesson_id: #{lesson.id}
      user_id: #{current_user.id}
      MSG
      ActionCable.server.broadcast(video_chat_room,
                                   message: message)
    else
      ActionCable.server.broadcast(video_chat_room,
                                  message: 'This room is not for you')
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  private
    def video_chat_room
      "video_chat:#{params['lesson_id']}"
    end
end

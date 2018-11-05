class LessonsController < ApplicationController
  before_action :set_lesson, only: [:video_chat]
  before_action :should_be_attendee, only: [:video_chat]

  def video_chat
    # mock. later should identify the partner
    @partner = Tutor.first
  end

  private

    def set_lesson
      @lesson = Lesson.find(params[:id])
      redirect_to root_path unless @lesson
    end

    def should_be_attendee
      # should look up current_user,
      # but using current_student mock for now
      unless @lesson.attendee?(current_student)
        redirect_to root_path
      end
    end
end

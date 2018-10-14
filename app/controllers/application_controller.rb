class ApplicationController < ActionController::Base
  around_action :user_time_zone, if: :current_student

  private
    def user_time_zone(&block)
      Time.use_zone(current_student.time_zone, &block)
    end

    # mock current_student method for now
    # should look up user model when log-in function fully implemented
    def current_student
      @current_student ||= Student.first
    end
end

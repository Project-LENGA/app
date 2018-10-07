class Student::Base < ApplicationController
  def current_student
    @current_student ||= Student.first
  end
end

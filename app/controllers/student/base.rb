class Student::Base < ApplicationController
  # mock usage until login function implemented
  def current_student
    @current_student ||= Student.first
  end
end

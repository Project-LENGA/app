class Student::TutorsController < Student::Base
  def index
    @tutors = User.tutors
  end
end

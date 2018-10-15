class Student::TutorsController < Student::Base
  def index
    @tutors = Tutor.all
  end
end

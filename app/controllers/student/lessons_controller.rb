class Student::LessonsController < Student::Base
  def index
    @lessons = current_student.lessons
  end
end

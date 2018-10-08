class Student::LessonsController < Student::Base
  include FormSupporter

  def index
    @lessons = current_student.lessons
  end

  def new
    @lesson = Lesson.new(
      student: current_student,
      tutor: Tutor.find(params[:tutor_id])
    )
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.student = current_student
    @lesson.start_time = get_time_from_time_select_tag(params[:lesson], 'start_time')
    @lesson.end_time = get_time_from_time_select_tag(params[:lesson], 'end_time')
    if @lesson.save
      redirect_to tutors_path
    else
      render 'new'
    end
  end

  private
    def lesson_params
      params.require(:lesson).permit(:tutor_id, :lesson_date)
    end
end

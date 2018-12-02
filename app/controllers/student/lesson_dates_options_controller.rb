class Student::LessonDatesOptionsController < Student::Base

  def index
    @tutor = Tutor.find(params[:tutor_id])
    @lesson_dates_options = @tutor.lesson_dates_option
  end

  def show
    @tutor = Tutor.find(params[:tutor_id])
    @lesson_dates_options = @tutor.lesson_dates_options
  end
end

student = Student.first
tutors = Tutor.all.sample(3)

tutors.each do |t|
  lesson_date_num = rand(2..8)
  lesson_date = Date.today + lesson_date_num.days
  Lesson.create(
    student: student,
    tutor: t,
    start_time: Time.now,
    end_time: Time.now + 1.hour,
    lesson_date: lesson_date
  )
end

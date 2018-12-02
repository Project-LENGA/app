student = User.students.first.student
tutors = User.tutors.take(3).map(&:tutor)

10.times do |n|
  tutor = tutors.sample
  ldo = LessonDatesOption.new

  ldo[:is_reserved] = [true, false].sample
  ldo[:is_accepted] = [true, false].sample
  ldo[:date_accepted] = Date.today - rand(2..8)
  ldo[:lesson_date] = Date.today + rand(2..8)
  ldo[:lesson_time] = Time.now + rand(24*60*50)
  ldo[:lesson_duration] = [15, 30].sample
  ldo.student = student
  ldo.tutor = tutor

  ldo.save!
end

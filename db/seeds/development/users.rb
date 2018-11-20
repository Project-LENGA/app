names = %w(John Smith Bruno Mars)

10.times do |n|
  name = names[n % names.length]
  User.create(
    name: "#{name}_#{n}",
    password: "password",
    email: "test_tutor_#{name}#{n}@example.com"
  )
end

student = User.first
student.update(student_activated: true)
student.student = Student.create

tutors = User.where(id: [2..10])
tutors.each do |t|
  t.update(tutor_activated: true)
  t.tutor = Tutor.create
end

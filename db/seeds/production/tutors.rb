names = %w(John Smith Bruno Mars )

10.times do |n|
  name = names[n % names.length]
  Tutor.create(
    name: "#{name}_#{n}",
    password: "password",
    email: "test_tutor_#{name}#{n}@example.com"
  )
end

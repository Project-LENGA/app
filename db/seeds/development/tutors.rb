names = %w(John Smith Bruno Mars )

10.times do |n|
  name = names[n % names.length]
  user = Faker::Omniauth.facebook
  Tutor.create(
    name: "#{name}_#{n}",
    password: "password",
    email: "test_tutor_#{name}#{n}@example.com",
    image: 'http://graph.facebook.com/1234567/picture?type=square',
  )
end

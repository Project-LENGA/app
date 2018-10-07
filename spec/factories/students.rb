FactoryBot.define do
  factory :student do
    name 'test student'
    sequence(:email) { |n| "student#{n}@example.com" }
  end
end

FactoryBot.define do
  factory :user do
    name 'John smith'
    sequence(:email) { |n| "user#{n}@example.com" }
  end
end

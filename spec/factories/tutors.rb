FactoryBot.define do
  factory :tutor do
    name 'test tutor'
    sequence(:email) { |n| "tutor#{n}@example.com" }
  end
end

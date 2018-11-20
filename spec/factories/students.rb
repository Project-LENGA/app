# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

FactoryBot.define do
  factory :student do
    name 'test student'
    sequence(:email) { |n| "student#{n}@example.com" }
  end
end

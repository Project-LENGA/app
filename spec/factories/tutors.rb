# == Schema Information
#
# Table name: tutors
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

FactoryBot.define do
  factory :tutor do
    name 'test tutor'
    sequence(:email) { |n| "tutor#{n}@example.com" }
  end
end

# == Schema Information
#
# Table name: lessons
#
#  id          :integer          not null, primary key
#  tutor_id    :integer
#  student_id  :integer
#  start_time  :time             not null
#  end_time    :time             not null
#  lesson_date :date             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :lesson do
    start_time Time.now
    end_time Time.now + 1.hour
    lesson_date Date.today
    student_id { FactoryBot.create(:student).id }
    tutor_id { FactoryBot.create(:tutor).id }
  end
end

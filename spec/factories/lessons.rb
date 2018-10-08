FactoryBot.define do
  factory :lesson do
    start_time Time.now
    end_time Time.now + 1.hour
    lesson_date Date.today
    student_id { FactoryBot.create(:student).id }
    tutor_id { FactoryBot.create(:tutor).id }
  end
end

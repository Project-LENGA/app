FactoryBot.define do
  factory :lesson_dates_option do
    is_reserved { false }
    is_accepted { false }
    date_accepted { "2018-12-01" }
    tutor { nil }
    student { nil }
  end
end

class Tutor < User
  has_many :lessons
  has_many :lesson_dates_option, dependent: :destroy
end

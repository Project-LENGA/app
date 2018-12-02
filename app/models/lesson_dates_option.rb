class LessonDatesOption < ApplicationRecord
  belongs_to :tutor
  belongs_to :student

  validates :tutor_id, presence: true
end

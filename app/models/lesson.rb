class Lesson < ApplicationRecord
  belongs_to :student, class_name: 'User', foreign_key: 'student_id'
  belongs_to :tutor, class_name: 'User', foreign_key: 'tutor_id'

  validates :start_time, :end_time, :lesson_date, presence: true
  validate :start_time_is_earlier_than_end_time

  def attendee?(user)
    user == tutor || user == student
  end

  private
    def start_time_is_earlier_than_end_time
      if start_time.present? && end_time.present?
        if start_time > end_time
          errors.add(:start_time, 'Start time must be earlier than end time')
        end
      end
    end
end

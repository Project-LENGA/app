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

class Lesson < ApplicationRecord
  belongs_to :student
  belongs_to :tutor

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

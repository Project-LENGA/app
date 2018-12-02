# == Schema Information
#
# Table name: tutors
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Tutor < ApplicationRecord
  has_many :lessons
  has_many :lesson_dates_option, dependent: :destroy
  belongs_to :user
end

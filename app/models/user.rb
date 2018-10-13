class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :time_zone, inclusion: { in: ActiveSupport::TimeZone.all.map(&:name) }
end

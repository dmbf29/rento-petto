class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pet

  validates :start_date, presence: true
  validates :return_date, presence: true
  validates :status, presence: true
end

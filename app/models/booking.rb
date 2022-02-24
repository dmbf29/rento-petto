class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pet

  validates :start_date, presence: true
  validates :return_date, presence: true
  validates :status, presence: true
  # validates :rating, inclusion { in: [0, 1, 2, 3], allow_nil: false }

  validate :dates_cannot_be_in_the_past
  validate :start_before_return
  enum status: {
    pending: 0,
    accepted: 1,
    declined: 2,
    archived: 3
  }

  def dates_cannot_be_in_the_past
    errors.add(:start_date, "Sorry, can't be in the past") if start_date.present? && start_date < Date.today
    errors.add(:return_date, "Sorry, can't be in the past") if return_date.present? && return_date < Date.today
  end

  def start_before_return
    errors.add(:checkout, "Sorry, starting date can't be before returning date.") if start_date.present? && return_date.present? && return_date < start_date
  end


end

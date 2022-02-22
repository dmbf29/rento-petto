class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pet

  validates :start_date, presence: true
  validates :return_date, presence: true
  validates :status, presence: true

  validate :dates_cannot_be_in_the_past
  validate :start_before_return

  def dates_cannot_be_in_the_past
    errors.add(:start_date, "Sorry, can't be in the past") if start_date.present? && start_date < Date.today
    errors.add(:return_date, "Sorry, can't be in the past") if return_date.present? && return_date < Date.today
  end

  def start_before_return
    errors.add(:checkout, "Sorry, starting date can't be before returning date.") if start_date.present? && return_date.present? && return_date < start_date
  end

  enum status: {
    pending: 0,
    active: 1,
    archived: 2
  }

end

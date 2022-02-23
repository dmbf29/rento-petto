class ChangeDateToBeDatetimeInBookings < ActiveRecord::Migration[6.1]
  def change
    change_column(:bookings, :start_date, :datetime)
    change_column(:bookings, :return_date, :datetime)
  end
end

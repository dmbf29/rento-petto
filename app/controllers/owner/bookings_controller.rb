class Owner::BookingsController < ApplicationController
  def index
    @bookings = policy_scope([:owner, Booking])
    # select one booking
    # @booking.status = # whatver button user selects
  end

end

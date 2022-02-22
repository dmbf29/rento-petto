class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      user.bookings
    end
  end

  def create?
    true
  end

  def edit?
    true
  end
end

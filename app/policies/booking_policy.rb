class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      user.bookings # whoever is logged in, it will give you that user's bookings
    end
  end

  def create?
    true
  end

  def edit?
    true
  end
end

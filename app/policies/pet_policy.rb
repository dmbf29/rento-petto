class PetPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all # this gives me all the Pets, same as Pet.all with policy_scope()
    end
  end

  def show?
    true
  end

  def create?
    true
  end
end

# record, user

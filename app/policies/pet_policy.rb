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

  def update?
    record.user == user # only the pet creator can update it
  end

  def destroy?
    record.user == user # only the pet creator can destroy it
  end

end

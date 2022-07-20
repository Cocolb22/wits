class ProfilePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    record == user
  end

  def edit?
    true
  end

  def update?
    true
  end

  def spots?
    true
  end

  def comments?
    true
  end

  def spots
    record == user
  end

def comments
  true
end

end

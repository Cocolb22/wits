class SpotPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def new?
    user.profile_exp >= 500
  end

  def create?
    new?
  end

  def show?
    true
  end

  def search?
    true
  end

  def forecast?
    true
  end

  def comments?
    true
  end

  def upvote?
    true
  end

  def downvote?
    true
  end
end

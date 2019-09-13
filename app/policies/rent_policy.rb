class RentPolicy < ApplicationPolicy
  def index?
    record.find_by(user_id: user.id)
  end

  def create?
    user.id == record.user.id
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.where(user: user)
    end
  end
end

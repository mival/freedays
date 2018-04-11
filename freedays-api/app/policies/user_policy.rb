class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin? || user.supervisor?
        scope
      else
        #scope.where(id: user.id)s
        scope
      end
    end
  end

  def index?
    true
  end

  def destroy?
    !!user
  end
end
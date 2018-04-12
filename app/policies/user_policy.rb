class UserPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  def update?
    user.admin? || user.id == record.user_id
  end

  def show?
    user.admin? || user.id == record.user_id
  end

  def create?
    user.admin?
  end

end
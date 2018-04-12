class VacationTypePolicy < ApplicationPolicy

  def index?
    !!user
  end

  def create?
    user.admin? || admin.supervisor?
  end

  def show?
    !!user
  end

  def destroy?
    user.admin? || admin.supervisor?
  end

  def update?
    user.admin? || admin.supervisor?
  end

end
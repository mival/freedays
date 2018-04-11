class VacationRequestPolicy < ApplicationPolicy

  def index?
    user.admin? || record.accepted
  end

  def show?
    user.admin?
  end

  def create?
    user.worker? || user.supervisor? || user.admin?
  end

  def update?
    user.id == record.user_id || user.supervisor? || user.admin?
  end

  def destroy?
    user.id == record.user_id || user.supervisor? || user.admin?
  end

  def my_vacations?
    !!user
  end

  class Scope < Scope
    def resolve
      if user.admin?
        scope
      else
        scope.where(accepted: true)
      end
    end
  end

end
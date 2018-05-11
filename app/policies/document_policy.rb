class DocumentPolicy < ApplicationPolicy
  def create?
    user.worker? || user.supervisor? || user.admin?
  end

  def update?
    user.worker? || user.supervisor? || user.admin?
  end

  def destroy?
    user.worker? || user.supervisor? || user.admin?
  end

end
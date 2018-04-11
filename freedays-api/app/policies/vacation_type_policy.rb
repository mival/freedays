class VacationTypePolicy < ApplicationPolicy

  def index?
    !!user
  end

end
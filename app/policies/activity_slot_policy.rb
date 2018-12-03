class ActivitySlotPolicy < ApplicationPolicy

  def create?
    record.service.user == user || user.admin
  end

  def edit?
    record.service.user == user || user.admin
  end

  def update?
    record.service.user == user || user.admin
  end

  def destroy?
    record.service.user == user || user.admin
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end

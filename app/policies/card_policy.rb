class CardPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def actions?
    update? || destroy?
  end

  def update?
    record.collection.user == user
  end

  def destroy?
    record.collection.user == user
  end
end

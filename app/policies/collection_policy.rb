class CollectionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def list_cards?
    record.user == user or record.public?
  end
  
  def create_card?
    record.user == user
  end
end

class DealPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    true
  end

  def show?
    record.requester_id == user.id || record.answerer_id == user.id
  end


  def update?
    show?
  end

  def destroy?
    show?
  end

  def accept_deal?
    record.requester_id == user.id || record.answerer_id == user.id

  end

  def reject_deal?
    record.requester_id == user.id || record.answerer_id == user.id
  end
end

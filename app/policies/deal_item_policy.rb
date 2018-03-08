class DealItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

    def show?
      record.deal.requester_id = user || record.deal.answerer_id = user
    end

    def create?
      show?
    end

    def update?
      show?
    end

    def destroy?
      show?
    end
end

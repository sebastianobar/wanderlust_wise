# frozen_string_literal: true

class TravelPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    record.users.include?(user)
  end

  def create?
    user.has_strict_role?(:owner, record)
  end

  def new?
    true
  end

  def update?
    user.has_strict_role?(:owner, record)
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end

  def search_destinations?
    true
  end

  relation_scope do |relation|
    relation.includes(:users).where(users: { id: user.id })
  end
end

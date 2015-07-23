class MemoryPolicy < ApplicationPolicy
  def index?
    true
  end

  def new?
    create?
  end

  def edit?
    update?
  end

  def update?
    return true if user.present? && user.admin?
    user.present? && user == memory.user
  end

  def create?
    user.present? && (user.admin? || user.registered?)
  end

  def destroy?
    return true if user.present? && user.admin?
  end

  private

    def memory
      record
    end
end

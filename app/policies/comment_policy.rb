class CommentPolicy < ApplicationPolicy
  def index?
    true
  end

  def new?
    create?
  end

  def edit?
    false
  end

  def update?
    return true if user.present? && user.admin?
    user.present? && record.memory.user == user
  end

  def create?
    return false if @user.nil?
    user.present? && (user.admin? || user.registered?)
  end

  def destroy?
    return true if user.admin?
    user.present? && record.memory.user == user
  end

  private

    def comment
      record
    end
end

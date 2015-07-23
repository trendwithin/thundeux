class CommentPolicy < ApplicationPolicy
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
  end

  def create?
    return false if @user.nil?
    user.present? && (user.admin? || user.registered?)
  end

  def destroy?
    return true if user.admin?
  end

  private

    def comment
      record
    end
end

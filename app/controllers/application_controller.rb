class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected
    def after_sign_in_path_for(_resource)
      memories_path
    end
  private

  def user_not_authorized
    redirect_to(request.referrer || root_path)
    flash[:alert] = "You are not authorized to perfrom this action."
  end
end

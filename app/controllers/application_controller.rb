class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  add_flash_types :success, :warning, :danger, :info

  private

  def user_not_authorized
    flash[:danger] = "Access denied."
    redirect_to (request.referrer || root_path)
  end

end

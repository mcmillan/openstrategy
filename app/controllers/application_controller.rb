class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # skip_before_action :verify_authenticity_token, only: :handle_options_request

  def authenticate_admin!
    fail ActionController::RoutingError, 'Not an admin' unless user_signed_in? && current_user.admin?
  end
end

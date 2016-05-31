class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_admin!
    authenticate_user!
    fail ActionController::RoutingError, 'Not an admin' unless current_user.admin?
  end

  def authenticate_community_user!
    authenticate_user!
    fail ActionController::RoutingError, 'Not a valid community user' unless current_user.community_enabled?
  end

  def authenticate_jobs_user!
    authenticate_user!
    fail ActionController::RoutingError, 'Not a valid jobs user' unless current_user.jobs_enabled?
  end
end

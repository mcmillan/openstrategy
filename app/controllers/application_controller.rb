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
end

ActiveAdmin::ResourceController.class_eval do
   def find_resource
     resource_class.is_a?(FriendlyId) ? scoped_collection.where(slug: params[:id]).first! : scoped_collection.where(id: params[:id]).first!
   end
 end

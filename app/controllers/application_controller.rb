class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, only: :handle_options_request
  before_action :default_to_json
  after_action :add_wide_open_cors_headers, only: :handle_options_request, if: -> { request.format.json? }

  def default_to_json
    request.format = :json unless params[:format] || params[:controller] =~ /admin\//
  end

  def handle_options_request
    head(:ok)
  end

  private

  def add_wide_open_cors_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end
end

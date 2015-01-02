class EmailsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create], if: -> { request.format.json? }
  after_action :add_wide_open_cors_headers, only: [:create], if: -> { request.format.json? }

  def create
    email = params[:email]
    gb    = Gibbon::API.new

    gb.lists.subscribe(
      id: 'a15ef776d9',
      email: { email: email },
      double_optin: false,
      update_existing: true
    )

    head :no_content
  end
end

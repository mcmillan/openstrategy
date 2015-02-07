class EmailsController < ApplicationController
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

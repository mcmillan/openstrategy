class EmailsController < ApplicationController
  def create
    email = params[:email]
    gb    = Gibbon::API.new

    begin
      gb.lists.subscribe(
        id: 'a15ef776d9',
        email: { email: email },
        double_optin: false,
        update_existing: true
      )
    rescue => e
      return redirect_to root_url, alert: e.message
    end

    cookies.permanent[:subscribed_to_newsletter] = true

    redirect_to root_url, notice: "Thanks! You're all signed up!"
  end
end

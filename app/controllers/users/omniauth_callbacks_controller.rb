class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    @user = User.from_omniauth(request.env["omniauth.auth"])

    sign_in @user
    redirect_to 'http://openstrate.gy'
  end
end

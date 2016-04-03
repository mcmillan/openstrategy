class UsersController < ApplicationController
  before_action :load_user
  before_action :authenticate!, except: :show

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :location, :notifications_enabled, :bio)
  end

  def load_user
    @user = User.friendly.find(params[:id])
  end

  def authenticate!
    fail 'Impersonation attempt' unless @user == current_user
  end
end

class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def update
    @user = User.find(params[:user_id])
    if current_user.update(params.permit(:icon, :user_name, :introduce))
      redirect_to users_profile_path
    else
      render :edit
    end
  end

  def show
    @users = User.all
  end

  def edit
    params.permit(:icon, :user_name, :introduce)
  end

  def account
    @users = User.all
  end

  def profile
  end

end

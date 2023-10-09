class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def update
    if current_user.update(params[:id])
      redirect_to profile_users_path
    else
      render :edit
    end
  end

  def show
    @users = User.all
  end

  def edit
    @user = current_user.id
  end

  def account
    @users = User.all
  end

  def profile
  end

end

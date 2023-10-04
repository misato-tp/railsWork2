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

  def profile
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end
end

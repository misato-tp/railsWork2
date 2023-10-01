class UsersController < ApplicationController

  def update
    if @user.update(user_params)
      redirect_to :profile
    else
      render :edit
    end
  end

  def profile
    if @user.update
      redirect_to :profile
    else
      render "edit"
    end
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :email, :icon, :introduce)
  end
end

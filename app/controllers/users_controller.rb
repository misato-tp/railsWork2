class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_profile_path
    else
      render 'users/edit'
    end
  end

  def edit
    @user = current_user
  end

  def account
    @users = User.all
  end

  def profile
  end

end

private

def user_params
  params.require(:user).permit(:icon, :user_name, :introduce, :user_id)
end

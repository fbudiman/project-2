class UsersController < ApplicationController

  def index
    @user = User.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "You have created an account."
      redirect_to users_path
    else
      flash[:error] = "Your account could not be created. Please try again."
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end



end

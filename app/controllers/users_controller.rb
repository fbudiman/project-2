class UsersController < ApplicationController

  def index
    @user = User.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @users = User.all

    if @user.id != current_user.id
      flash[:error] = "You are not authorized to view this user's private page."
      render :index
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "You have created an account."
      redirect_to user_path(@user)
    else
      flash[:error] = "Your account could not be created. Please try again."
      redirect_to new_user_path
    end
  end

  # def destroy
  #   @user = User.find(params[:id])
  #   @user.destroy
  #   redirect_to destroy_session_path
  # end

  private

  def user_params
    params.require(:user).permit(:name, :profile_pic_url, :email, :password, :password_confirmation)
  end



end

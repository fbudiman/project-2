class UsersController < ApplicationController

  def index
    @user = User.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

    if @user.id != current_user.id
      flash[:error] = "You do not have access to other users' private information."
      redirect_to users_path
    end
  end

  def edit
    @user = User.find(params[:id])

    if @user.id != current_user.id
      flash[:error] = "You are not authorized to edit this user's info."
      redirect_to user_path(@user)
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      flash[:error] = "Please complete the required fields with correct information."
      redirect_to edit_user_path(@user)
    end
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

  def destroy
    @user = User.find(params[:id])

    if current_user.id == @user.id
      if @user.destroy
        flash[:success] = "Your account has been deleted."
        redirect_to destroy_session_path
      end
    end


  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_pic_url, :email, :password, :password_confirmation)
  end



end

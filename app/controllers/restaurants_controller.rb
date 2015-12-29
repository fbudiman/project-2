class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
    @user = User.new
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @restaurants = Restaurant.all
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
  end

  def new
    @restaurant = Restaurant.new

    if !current_user
      flash[:error] = "You must be signed in to add a restaurant."
      redirect_to restaurants_path
    end
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      flash[:success] = "You have added a new restaurant."
      redirect_to restaurant_path(@restaurant)
    else
      flash[:error] = "Your restaurant could not be added."
      redirect_to new_restaurant_path
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :location)
  end
end

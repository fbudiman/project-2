class RestaurantsController < ApplicationController

  def index
    @restaurant = Restaurant.new
    @restaurants = Restaurant.all
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

class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
    @user = User.new
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @restaurants = Restaurant.all
    @user = User.new
    @recipes = Recipe.where(:restaurant_id => @restaurant.id)
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
  end

  def new
    @restaurant = Restaurant.new
    @user = User.new

    if !current_user
      flash[:error] = "You must be signed in to add a restaurant."
      redirect_to restaurants_path
    end
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurants = Restaurant.all
    @user = User.new

    @restaurants.each do |restaurant|
      if restaurant.name == @restaurant.name && restaurant.location == @restaurant.location
        flash[:error] = "This restaurant already exists in the database."
        redirect_to restaurants_path and return
      end
    end

    if @restaurant.save
      flash[:success] = "You have added a new restaurant."
      return redirect_to restaurant_path(@restaurant)
    else
      flash[:error] = "Your restaurant could not be added."
      return redirect_to new_restaurant_path
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :location)
  end
end

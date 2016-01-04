class RecipesController < ApplicationController

  def index
    @user = User.new
  end

  def show
    @recipe = Recipe.find(params[:id])
    @user = User.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @restaurants = Restaurant.all

    if !current_user
      flash[:error] = "You must be signed in to edit a recipe."
      redirect_to recipe_path(@recipe)
    end
  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update_attributes(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def new
    @recipe = Recipe.new
    @restaurants = Restaurant.all

    if !current_user
      flash[:error] = "You must be signed in to add a recipe."
      redirect_to recipes_path
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      flash[:success] = "You have added a new recipe."
      redirect_to recipe_path(@recipe)
    else
      flash[:error] = "Your recipe could not be added."
      redirect_to new_recipe_path
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])

    if @recipe.destroy
      flash[:success] = "You have deleted a recipe."
      redirect_to recipes_path
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :body, :restaurant_id)
  end

end

# '<option value="<% restaurant.id %>"><%= restaurant.name %></option>') %>
# <%= select_tag(:city_id, options_for_select(...)) %>

# <%= options_for_select([['Lisbon', 1], ['Madrid', 2]], 2) %>

# <%= select_tag(:city_id, '<option value="1">Lisbon</option>...') %>

#  <%= select_tag(:city_id, '<option value="1">Lisbon</option>...') %>

# # options_for_select([[restaurant.name, restaurant.id]])) %>

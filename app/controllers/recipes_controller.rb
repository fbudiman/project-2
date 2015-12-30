class RecipesController < ApplicationController

  def index
    @user = User.new
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipes = Recipe.all
  end

  def edit
  end

  def update
  end

  def new
    @recipe = Recipe.new

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
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :body, :restaurant_id)
  end

end

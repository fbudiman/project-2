class RecipesController < ApplicationController

  def index
    @user = User.new
    @recipes = Recipe.all

    if params[:query]

      query = params[:query]
      recipe_list = Recipe.all
      @recipes = []

      recipe_list.each do |recipe|
        if params[:search] == "title"
          search_field = params[:search].to_sym
          if recipe[search_field].downcase.include? query.downcase
            @recipes << recipe
          end
        elsif params[:search] == "restaurant"
          if recipe.restaurant.name.downcase.include? query.downcase
            @recipes << recipe
          end
        end
      end

      return @recipes
    end

  end

  def show
    @recipe = Recipe.find(params[:id])
    @user = User.new
    @comment = Comment.new(:recipe => @recipe)
    @valid = false

    if current_user
      @recipe.likes.each do |like|
        if like.user_id == current_user.id
          @valid = true
        end
      end
    end

  end

  def edit
    @recipe = Recipe.find(params[:id])
    @restaurants = Restaurant.all
    @user = User.new

    if !current_user
      flash[:error] = "You must be signed in to edit a recipe."
      redirect_to recipe_path(@recipe)
    elsif current_user.id != @recipe.user_id
      flash[:error] = "You are not authorized to edit other users' recipes."
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
    @user = User.new

    if !current_user
      flash[:error] = "You must be signed in to add a recipe."
      redirect_to recipes_path
    else
      @user_id = current_user.id
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

    if current_user.id == @recipe.user_id
      if @recipe.destroy
        flash[:success] = "You have deleted a recipe."
        redirect_to recipes_path
      end
    else
      flash[:error] = "You cannot delete another user's recipe."
      redirect_to recipe_path(@recipe)
    end
  end

  def like
    @recipe = Recipe.find(params[:id])

    @recipe.likes.create(user_id: current_user.id)
    redirect_to recipe_path(@recipe)
  end

  def unlike
    @recipe = Recipe.find(params[:id])

    @recipe.likes.where(user_id: current_user.id).each { |like| like.destroy }
    redirect_to recipe_path(@recipe)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :body, :restaurant_id, :user_id)
  end

end



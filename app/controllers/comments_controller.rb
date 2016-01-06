class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      flash[:success] = "Comment was successfully created."
      redirect_to(@comment.recipe)
    else
      flash[:error] = "Error creating comment."
      redirect_to(@comment.recipe)
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @comment = Comment.find(params[:id])

    if current_user.id == @comment.user_id
      if @comment.destroy
        flash[:success] = "Your comment has been deleted."
        redirect_to recipe_path(@comment.recipe_id)
      end
    else
      flash[:error] = "You cannot delete other another user's comments."
      redirect_to recipe_path(@comment.recipe_id)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :recipe_id, :user_id)
  end

end

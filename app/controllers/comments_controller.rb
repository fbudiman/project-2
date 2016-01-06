class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      # flash[:success] = 'Comment was successfully created.'
      redirect_to(@comment.recipe)
    else
      # flash[:error] = "Error creating comment: #{@comment.errors}"
      redirect_to(@comment.recipe)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to(@comment.recipe)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :recipe_id, :user_id)
  end

end

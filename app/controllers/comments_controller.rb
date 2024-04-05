class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.create(comment_params.merge(user: current_user))
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user_id == current_user.id
      @comment.destroy
      redirect_to recipe_path(@comment.recipe_id), notice: 'Comment was successfully deleted.'
    else
      redirect_to recipe_path(@comment.recipe_id), alert: 'You are not authorized to delete this comment.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end

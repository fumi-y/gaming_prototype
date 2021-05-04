class CommentsController < ApplicationController
  def index
  end

  def create
    @comment = Comment.new
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, prototype_id: prototype(params[:id]))
  end
end

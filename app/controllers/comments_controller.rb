class CommentsController < ApplicationController
  def index
  end

  def create
    post = Comment.create(comment: params[:comment], user_id: current_user.id, prototype_id: params[:prototype_id])
    render json:{ post: post }
    # @comment = Comment.new(comment_params)
    # if @comment.save
    #   redirect_to prototype_path(@comment.prototype_id)
    # else
    #   @prototype = @comment.prototype
    #   @comments = @prototype.comments
    #   render "prototypes/show"
    # end
  end

  private

  # def comment_params
  #   params.require(:comment).permit(:comment).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  # end
end

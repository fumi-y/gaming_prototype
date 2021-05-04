class CommentsController < ApplicationController
  def index
  end

  def create
    @comment = Comment.new
  end
end

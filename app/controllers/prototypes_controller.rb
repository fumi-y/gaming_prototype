class PrototypesController < ApplicationController
  def index
    @prototype = Prototype.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    # @comment = Comment.new
    @comments = @prototype.comments.order(id: "DESC")
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype)
    else
      render :edit
    end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    if @prototype.destroy
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def prototype_params
    params.require(:prototype).permit(:name, :concept, :text, :genre_id, :platform_id, :publish_id, :image).merge(user_id: current_user.id)
  end
end

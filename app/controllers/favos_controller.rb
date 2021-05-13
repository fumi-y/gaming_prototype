class FavosController < ApplicationController
  def index
  end

  def create
    @favo = Favo.create(favo_params)
    if @favo.save
      redirect_to prototype_path(params[:prototype_id])
    end
  end

  private
  def favo_params
    params.require(:favo).permit(:iine_id).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end

class ReceptionsController < ApplicationController
  def create
    @unknown_flower = UnknownFlower.find(params[:unknown_flower_id])
    current_user.reception(@unknown_flower)
  end

  def destroy
    @unknown_flower = current_user.receptions.find(params[:id]).unknown_flower
    current_user.unreception(@unknown_flower)
  end
end

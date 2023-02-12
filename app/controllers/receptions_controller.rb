class ReceptionsController < ApplicationController
  def create
    unknown_flower = UnknownFlower.find(params[:unknown_flower_id])
    current_user.reception(unknown_flower)
    redirect_back fallback_location: unknown_flowers_path, success: t('.success')
  end

  def destroy
    unknown_flower = current_user.receptions.find(params[:id]).unknown_flower
    current_user.unreception(unknown_flower)
    redirect_back fallback_location: unknown_flowers_path, success: t('.success')
  end
end

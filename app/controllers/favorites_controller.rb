class FavoritesController < ApplicationController
  def create
    flower = Flower.find(params[:flower_id])
    current_user.favorite(flower)
    redirect_to request.referer, success: t('.success')
  end

  def destroy
    flower = current_user.favorites.find(params[:id]).flower
    current_user.unfavorite(flower)
    redirect_to request.referer, success: t('.success')
  end
end

class FavoritesController < ApplicationController
  def create
    flower = Flower.find(params[:flower_id])
    current_user.favorite(flower)
    redirect_back fallback_location: flowers_path, success: t('.success')
  end

  def destroy
    flower = current_user.favorites.find(params[:id]).flower
    current_user.unfavorite(flower)
    redirect_back fallback_location: flowers_path, success: t('.success')
  end
end

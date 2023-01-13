class FavoritesController < ApplicationController
  def create
    @flower_favorite = Favorite.new(user_id: current_user.id, flower_id: params[:flower_id])
    @flower_favorite.save
  end

end

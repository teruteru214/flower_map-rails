class FlowersController < ApplicationController
  before_action :require_login

  def index
    @flowers = Flower.all.includes(:user).order(created_at: :desc)
  end

  def new
    @flower = Flower.new
  end

  def create
    @flower = current_user.flowers.build(flower_params)
    if @flower.save
      redirect_to flowers_path, success: "投稿完了しました！"
    else
      flash.now['danger'] = "投稿が失敗しました。不足している項目があります"
      render :new
    end
  end

  def show
    @flower = Flower.find(params[:id])
  end

  private

  def flower_params
    params.require(:flower).permit(:name, :address, :datetime,:status, :flower_image, :flower_image_cache)
  end
end

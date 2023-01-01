class FlowersController < ApplicationController
  before_action :require_login

  def index
    @flowers = Flower.all.includes(:user).order(created_at: :desc)
  end

  def new
    @flower = Flower.new
  end

  def created
    @flower = current_user.flower.build(flower_params)
    if @flower.save
      redirect_to flowers_path, success: "投稿完了"
    else
      flash.now['danger'] = "投稿失敗"
      render :new
    end
  end

  def show
    @flower = Flower.find(params[:id])
  end

  private

  def flower_params
    params.require(:flower).permit(:name, :address, :datetime,:status)
  end
end

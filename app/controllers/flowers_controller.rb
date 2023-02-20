class FlowersController < ApplicationController
  before_action :find_flower, only: %i[edit update destroy favorite]

  def index
    @q = Flower.ransack(params[:q])
    @flowers = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page]).per(8)
  end

  def new
    @flower = Flower.new
  end

  def create
    @flower = current_user.flowers.build(flower_params)
    if @flower.save
      redirect_to flowers_path, success: t('.success')
    else
      flash.now['danger'] = t('.fail')
      render :new
    end
  end

  def show
    @flower = Flower.find(params[:id])
    gon.flower = @flower
    @comment = Comment.new
    @comments = @flower.comments.includes(:user).order(created_at: :desc)
  end

  def edit
    gon.flower = @flower
  end

  def update
    if @flower.update(flower_params)
      redirect_to @flower, success: t('.success')
    else
      flash.now['danger'] = t('.fail')
      render :edit
    end
  end

  def destroy
    @flower.destroy!
    redirect_to flowers_path, success: t('.success')
  end

  def favorites
    @favorite_flowers = current_user.favorite_flowers.includes(:user).order(created_at: :desc)
  end

  private

  def flower_params
    params.require(:flower).permit(:latitude, :longitude, :address, :address_detail, :name, :date, :status, :flower_image, :flower_image_cache)
  end

  def find_flower
    @flower = current_user.flowers.find(params[:id])
  end
end

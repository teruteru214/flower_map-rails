class UnknownFlowersController < ApplicationController
  before_action :find_unknown_flower, only: %i[edit update destroy]

  def index
    @unknown_flowers = UnknownFlower.all.includes(:user).order(created_at: :desc).page(params[:page]).per(8)
  end

  def new
    @unknown_flower = UnknownFlower.new
  end

  def create
    @unknown_flower = current_user.unknown_flowers.build(unknown_flower_params)
    if @unknown_flower.save
      redirect_to unknown_flowers_path, success: t('.success')
    else
      flash.now['danger'] = t('.fail')
      render :new
    end
  end

  def show
    @unknown_flower = UnknownFlower.find(params[:id])
    @answer = Answer.new
    @answers = @unknown_flower.answers.includes(:user).order(created_at: :desc)
  end

  def edit; end

  def update
    if @unknown_flower.update(unknown_flower_params)
      redirect_to @unknown_flower, success: t('.success')
    else
      flash.now['danger'] = t('.fail')
      render :edit
    end
  end

  def destroy
    @unknown_flower.destroy!
    redirect_to unknown_flowers_path, success: t('.success')
  end

  def receptions
    @unknown_flowers = current_user.receptions_unknown_flowers
  end

  private

  def unknown_flower_params
    params.require(:unknown_flower).permit(:image, :image_cache, :date, :feature)
  end

  def find_unknown_flower
    @unknown_flower = current_user.unknown_flowers.find(params[:id])
  end
end

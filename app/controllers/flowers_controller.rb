class FlowersController < ApplicationController
  before_action :require_login
  before_action :find_flower, only: %i[edit update destroy]

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
    @comment = Comment.new
    @comments = @flower.comments.includes(:user).order(created_at: :desc)
  end

  def edit; end

  def update
    if @board.update(flower_params)
      redirect_to @flower, success: '編集が完了しました！'
    else
      flash.now['danger'] = '編集が失敗しました'
      render :edit
    end
  end

  def destroy
    @flower.destroy!
    redirect_to flowers_path, success: '削除が完了しました！'
  end
  private

  def flower_params
    params.require(:flower).permit(:name, :address, :datetime,:status, :flower_image, :flower_image_cache, :latitude, :longitude)
  end

  def find_flower
    @flower = current_user.flowers.find(params[:id])
  end
end

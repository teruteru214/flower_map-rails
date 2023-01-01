class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to flowers_path, success: "ログインが完了！"
    else
      flash.now[:danger] = "ログインが失敗"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, success: "ログアウト完了！"
  end
end

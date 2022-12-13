class UserSessionsController < ApplicationController
  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to root_path, success: "ログインが完了！"
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

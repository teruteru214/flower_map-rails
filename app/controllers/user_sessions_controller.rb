class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to flowers_path, success: "ログインが完了しました!"
    else
      flash.now[:danger] = "ログインに失敗しました。入力項目が不足しています"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, success: "ログアウト完了しました！"
  end
end

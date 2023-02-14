class OauthsController < ApplicationController
  skip_before_action :require_login
  def oauth
    login_at(auth_params[:provider])
  end

  def callback
    provider = auth_params[:provider]

    if auth_params[:denied].present?
      redirect_to new_flower_path, success: t('.success1')
      return
    end

    begin
      create_user_from(provider) unless (@user = login_from(provider))
      redirect_to new_flower_path, success: t('.success2')

    rescue StandardError
      redirect_to login_path, danger: t('.fail')
    end
  end

  private

  def auth_params
    params.permit(:code, :provider, :denied)
  end

  def create_user_from(provider)
    @user = create_from(provider)
    reset_session
    auto_login(@user)
  end
end

class FlowersController < ApplicationController
  before_action :require_login

  def index
    @flowers = Flower.all.includes(:user).order(created_at: :desc)
  end
end

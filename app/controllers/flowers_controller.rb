class FlowersController < ApplicationController
  def index
    @flowers = Flower.all.includes(:user).order(created_at: :desc)
  end
end

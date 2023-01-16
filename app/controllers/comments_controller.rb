class CommentsController < ApplicationController
  before_action :require_login

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to flower_path(@comment.flower), success: t('.success')
    else
      redirect_to flower_path(@comment.flower), danger: t('.fail')
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(flower_id: params[:flower_id])
  end
end

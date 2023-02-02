class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to flower_path(@comment.flower), success: t('.success')
    else
      redirect_to flower_path(@comment.flower), danger: t('.fail')
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy!
    redirect_back fallback_location: flower_path, success: t('.success')
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :evaluation).merge(flower_id: params[:flower_id])
  end
end

class CommentsController < ApplicationController
  def create
    comment = current_user.comments.build(comment_params)
    if comment.save
      redirect_to flower_path(comment.flower), success: 'コメント投稿完了しました！'
    else
      redirect_to flower_path(comment.flower), danger: 'コメント投稿失敗しました'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(flower_id: params[:flower_id])
  end
end

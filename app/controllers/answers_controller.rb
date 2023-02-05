class AnswersController < ApplicationController
  def create
    @answer = current_user.answers.build(answer_params)
    if @answer.save
      redirect_to unknown_flower_path(@answer.unknown_flower), success: t('.success')
    else
      redirect_to unknown_flower_path(@answer.unknown_flower), danger: t('.fail')
    end
  end

  def destroy
    @answer = current_user.answers.find(params[:id])
    @answer.destroy!
    redirect_back fallback_location: unknown_flower_path, success: t('.success')
  end

  private

  def answer_params
    params.require(:answer).permit(:body, :evaluation).merge(unknown_flower_id: params[:unknown_flower_id])
  end
end

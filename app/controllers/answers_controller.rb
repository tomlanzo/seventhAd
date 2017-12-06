class AnswersController < ApplicationController
  def create
    answer = params[:answer]

    @question = Question.where(game: @question.game, position: @question.position += 1)

  end

  def answer_params
    params.require(:vehicle).permit(:answer)
  end
end

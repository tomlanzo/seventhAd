class AnswersController < ApplicationController

  def create
    @answer = Answer.new(answer_params)
    @answer.game_session = @answer.player.game_session
    @answer.correct = @answer.choice == @question.correct_answer

    if @answer.save
    #   redirect_to booking_path(@booking)
    else
      # render :new
    end

  end

  private

  def answer_params
    params.require(:answer).permit(:choice, :player, :question)
  end
end

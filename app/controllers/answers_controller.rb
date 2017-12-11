class AnswersController < ApplicationController

  def create
    @answer = Answer.new(answer_params)
    @answer.player = Player.find(params[:player_id])
    @answer.question = Question.find(params[:question_id])
    @answer.game_session = @answer.player.game_session
    @answer.correct = @answer.choice == @answer.question.correct_answer

    if @answer.save
      @question = @answer.question
      @player = @answer.player
      render 'questions/countdown'
    else
      flash[:alert] ="La réponse n'a pas été enregistrée, reesayez, svp"
    end

  end

  private

  def answer_params
    params.require(:answer).permit(:choice)
  end
end

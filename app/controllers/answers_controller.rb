class AnswersController < ApplicationController

  def create
    @answer = Answer.new(answer_params)
    @answer.player = Player.find(params[:player_id])
    @answer.question = Question.find(params[:question_id])
    @answer.game_session = @answer.player.game_session
    @answer.correct = @answer.choice == @answer.question.correct_answer
    if @answer.save
      flash[:notice] = "Reponse #{@answer.choice} bien enregistrée"
      # if @answer.question.position == 3
      #  redirect_to edit_player_path(@answer.player)
      # else
      #   @next_question = Question.where(game: @answer.question.game,
      #                    position: @answer.question.position += 1)
      #   redirect_to player_question_path(@answer.player, @next_question.first.id)
      # end
    else
      # render :new
      flash[:alert] ="La réponse n'a pas été enregistrée, reesayez, svp"
    end

  end

  private

  def answer_params
    params.require(:answer).permit(:choice)
  end
end

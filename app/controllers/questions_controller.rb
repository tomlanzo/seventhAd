class QuestionsController < ApplicationController
  before_action :disable_nav_footer

  def show
    @question = Question.find(params[:id])
    @player = Player.find(params[:player_id])
    @answer = Answer.new

    @next_question = Question.where(game: @question.game,
                     position: @question.position += 1)

    if @next_question.empty?
       @redirect_path = edit_player_path(@player)
    else
       @redirect_path = player_question_path(@player, @next_question.first.id)
    end
  end

end

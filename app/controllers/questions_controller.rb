class QuestionsController < ApplicationController

  def show
    @question = Question.find(params[:id])
    @player = Player.find(params[:player_id])
    @answer = Answer.new
  end

end

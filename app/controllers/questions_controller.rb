class QuestionsController < ApplicationController
  before_action :disable_nav_footer

  def show
    @question = Question.find(params[:id])
    @player = Player.find(params[:player_id])
    @answer = Answer.new
  end

end

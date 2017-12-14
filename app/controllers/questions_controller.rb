class QuestionsController < ApplicationController
  before_action :disable_nav_footer

  def show
    @question = Question.find(params[:id])
    @player = Player.find(params[:player_id])
    @next_question_start_at = Time.now+@question.duration
    @answer = Answer.new

#    Rails.logger.debug "GS-DEBUG GameSession status=#{@question.game.game_sessions.last.status}"
  end

  def countdown; end

end

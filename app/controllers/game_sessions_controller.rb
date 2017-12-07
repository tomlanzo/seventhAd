class GameSessionsController < ApplicationController
  before_action :set_game_session, only: [:show, :check_player_token]
  before_action :disable_nav_footer

  def show
    @game_session.calculate_duration

    @seance = @game_session.seance

    check_player_token

    @players = @game_session.players

    @players_count = @players.count

    @players.each(&:calculate_score)

    @players_ordered = @players.order(score: :desc, time_taken: :asc)
  end

  def set_game_session
    @game_session = GameSession.find(params[:id])
  end

  private

  def check_player_token
    if session[:player_token].nil?
      player = Player.create!(game_session: @game_session)
      session[:player_token] = player.token
    end
  end
end

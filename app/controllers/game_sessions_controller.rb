class GameSessionsController < ApplicationController
  before_action :set_game_session, only: [:show, :players_count]

  def show
    @seance = @game_session.seance

    check_player_token

    @players_count = @game_session.players.count

  end

  def players_count
    @players_count = @game_session.players.count
  end

  private

  def set_game_session
    @game_session = GameSession.find(params[:id])
  end

  def check_player_token
    if session[:player_token].nil?
      player = Player.create!(game_session: @game_session)
      session[:player_token] = player.token
    end
  end
end

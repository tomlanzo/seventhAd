class GameSessionsController < ApplicationController
  before_action :set_game_session, only: [:show, :check_player_token, :players_count, :players_ordered]
  before_action :disable_nav_footer

  def show
    @seance = @game_session.seance

    check_player_token

    @players = @game_session.players
    @players_count = @players.count

    @players_ordered = @game_session.players.order(ranking: :asc)
    @winners = @players_ordered.where(winner: true)
    @question = Question.new(game: @game_session.game)

    # Rails.logger.debug "GS-DEBUG id=#{@game_session.id} status is now #{@game_session.status}!"
  end

  def players_count
    @players_count = @game_session.players.count + "<br/><label>joueurs</label>"
  end

  def players_ordered
    @game_session.calculate_ranking
    @players_ordered = @game_session.players.order(ranking: :asc)
    @winners = @players_ordered.where(winner: true)
  end

  private

  def set_game_session
    @game_session = GameSession.find(params[:id])
  end

  def check_player_token
    @player = Player.find_by_token(session[:player_token]) if session[:player_token]
    if @player.nil?
      @player = Player.create!(game_session: @game_session)
      session[:player_token] = @player.token
    end
  end
end

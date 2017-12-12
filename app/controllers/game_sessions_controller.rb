class GameSessionsController < ApplicationController
  before_action :set_game_session, only: [:show, :check_player_token, :players_count]
  before_action :disable_nav_footer

  def show
    @game_session.calculate_duration

    @seance = @game_session.seance

    check_player_token

    @players = @game_session.players
    @players_count = @players.count

    @players.each(&:calculate_score)

    @question = Question.new

    @players_ordered = calculate_ranking(@players)

  end

  def players_count
    @players_count = @game_session.players.count
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

  def calculate_ranking(players)
    players_ordered = players.order(score: :desc, time_taken: :asc)
    i = 1
    players_ordered.each do |player|
      player.ranking = i
      i += 1
      player.save(validate: false)
    end
    players_ordered
  end
end

class DashboardController < ApplicationController
  before_action :authenticate_company!
  def index
    @game_sessions = current_company.game_sessions

    @sessions_names = []
    @sessions_players = []
    @sessions_signed_players = []

    @game_sessions.each do |game_session|
      signed_players = 0
      if game_session.players.any?
        game_session.players.each do |player|
          player.email.nil? ? "" : signed_players += 1
        end
      end
      # a = [game_session.id.to_s, game_session.seance.cinema.name, game_session.seance.movie].join("\n")
      # puts a
# game_session.seance.movie
      @sessions_names.push(game_session.id)
      @sessions_players.push(game_session.players.count-signed_players)
      @sessions_signed_players.push(signed_players)
    end
  end

end

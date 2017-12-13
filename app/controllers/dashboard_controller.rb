class DashboardController < ApplicationController
  before_action :authenticate_company!
  def index
    @game_sessions = current_company.game_sessions

    @sessions_names = []
    @sessions_unsigned_players = []
    @sessions_signed_players = []

    @game_sessions.each do |game_session|
      @sessions_names.push(game_session.id)
      @sessions_unsigned_players.push(game_session.count_unsigned_players)
      @sessions_signed_players.push(game_session.count_signed_players)
    end
  end

end

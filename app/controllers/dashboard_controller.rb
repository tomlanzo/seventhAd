class DashboardController < ApplicationController
  before_action :authenticate_company!
  def index
    @game_sessions = current_company.game_sessions
  end
end

class SessionsController < ApplicationController
  before_action :set_session, only: [:show]

  def show
    @seance = @session.seance
  end

  def set_session
    @session = Session.find(params[:id])
  end
end

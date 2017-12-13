class ActivateGameSessionJob < ApplicationJob
  queue_as :default

  def perform(game_session_id)
    game_session = GameSession.find(game_session_id)
    game_session.active!
    # Rails.logger.debug "GS-DEBUG Job activate: id=#{game_session_id} status is now #{game_session.status}!"

    FinishGameSessionJob
      .set(wait_until: game_session.starting_at + game_session.duration)
      .perform_later(game_session_id)
  end
end

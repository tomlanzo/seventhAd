class FinishGameSessionJob < ApplicationJob
  queue_as :default

  def perform(game_session_id)
    game_session = GameSession.find(game_session_id)
    game_session.finished!
    game_session.players.each(&:calculate_score)
    game_session.calculate_ranking
    CloseGameSessionJob
      .set(wait_until: game_session.ending_at)
      .perform_later(game_session_id)

    # Rails.logger.debug "GS-DEBUG Job finish: id=#{game_session_id} status is now #{game_session.status}!"
  rescue ActiveRecord::RecordNotFound
    # NOOP
  end
end

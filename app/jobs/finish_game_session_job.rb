class FinishGameSessionJob < ApplicationJob
  queue_as :default

  def perform(game_session_id)
    game_session = GameSession.find(game_session_id)
    game_session.finished!
    FinishGameSessionJob.perform_at(game_session.ending_at, game_session_id)
  end
end

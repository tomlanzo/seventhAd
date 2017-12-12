class ActivateGameSessionJob < ApplicationJob
  queue_as :default

  def perform(game_session_id)
    game_session = GameSession.find(game_session_id)
    game_session.active!

    FinishGameSessionJob.perform_at(
      game_session.starting_at + game_session.duration,
      game_session_id)
  end
end

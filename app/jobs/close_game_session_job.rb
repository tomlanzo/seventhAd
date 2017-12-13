class CloseGameSessionJob < ApplicationJob
  queue_as :default

  def perform(game_session_id)
    game_session = GameSession.find(game_session_id)
    game_session.closed!
    # Rails.logger.debug "GS-DEBUG Job close: id=#{game_session_id} status is now #{game_session.status}!"
    game_session.calculate_winners

    game_session.reload

    game_session.players.each do |player|
      PlayerMailer.congrats(player).deliver_now if player.winner
      PlayerMailer.thanks(player).deliver_now if player.email? && !player.winner
    end
  end
end

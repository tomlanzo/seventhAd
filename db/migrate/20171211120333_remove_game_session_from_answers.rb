class RemoveGameSessionFromAnswers < ActiveRecord::Migration[5.1]
  def change
    remove_reference :answers, :game_session, foreign_key: true
  end
end

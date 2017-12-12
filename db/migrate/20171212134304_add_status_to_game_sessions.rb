class AddStatusToGameSessions < ActiveRecord::Migration[5.1]
  def change
    add_column :game_sessions, :status, :integer
  end
end

class AddColumnEndingAtToGameSessions < ActiveRecord::Migration[5.1]
  def change
    add_column :game_sessions, :ending_at, :datetime
  end
end

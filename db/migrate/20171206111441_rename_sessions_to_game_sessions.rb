class RenameSessionsToGameSessions < ActiveRecord::Migration[5.1]
  def change
    rename_table :sessions, :game_sessions
  end
end

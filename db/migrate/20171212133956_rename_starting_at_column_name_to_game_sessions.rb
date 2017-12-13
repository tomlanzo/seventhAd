class RenameStartingAtColumnNameToGameSessions < ActiveRecord::Migration[5.1]
  def change
    rename_column :game_sessions, :starting_at, :created_at
  end
end

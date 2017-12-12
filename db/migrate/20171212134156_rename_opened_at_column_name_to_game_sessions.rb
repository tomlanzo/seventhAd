class RenameOpenedAtColumnNameToGameSessions < ActiveRecord::Migration[5.1]
  def change
    rename_column :game_sessions, :opened_at, :starting_at
  end
end

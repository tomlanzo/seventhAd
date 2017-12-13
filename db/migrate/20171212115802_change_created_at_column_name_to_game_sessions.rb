class ChangeCreatedAtColumnNameToGameSessions < ActiveRecord::Migration[5.1]
  def change
    rename_column :game_sessions, :created_at, :starting_at
  end
end

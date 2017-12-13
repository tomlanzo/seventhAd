class ChangeColumnOffsetToGameSessions < ActiveRecord::Migration[5.1]
  def change
    rename_column :game_sessions, :offset, :offset_start
  end
end

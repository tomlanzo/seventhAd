class AddColumnToGameSessions < ActiveRecord::Migration[5.1]
  def change
    add_column :game_sessions, :offset_end, :integer
  end
end

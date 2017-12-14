class SetDefaultStatusToGameSessions < ActiveRecord::Migration[5.1]
  def up
    change_column :game_sessions, :status, :integer, default: 0, null: false
  end

  def down
    change_column :game_sessions, :status, :integer
  end
end

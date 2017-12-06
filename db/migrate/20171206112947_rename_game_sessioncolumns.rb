class RenameGameSessioncolumns < ActiveRecord::Migration[5.1]
  def change
    rename_column :players, :session_id, :game_session_id
    rename_column :answers, :session_id, :game_session_id
  end
end

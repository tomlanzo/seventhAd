class AddGameToSessions < ActiveRecord::Migration[5.1]
  def change
    add_reference :sessions, :game, foreign_key: true
  end
end

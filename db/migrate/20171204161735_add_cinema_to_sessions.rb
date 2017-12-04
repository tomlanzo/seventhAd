class AddCinemaToSessions < ActiveRecord::Migration[5.1]
  def change
    add_reference :sessions, :cinema, foreign_key: true
  end
end

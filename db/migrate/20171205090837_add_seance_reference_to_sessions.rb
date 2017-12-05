class AddSeanceReferenceToSessions < ActiveRecord::Migration[5.1]
  def change
    add_reference :sessions, :seance, foreign_key: true, index: true
  end
end

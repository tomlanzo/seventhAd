class AddSessionReferenceToPlayers < ActiveRecord::Migration[5.1]
  def change
    add_reference :players, :session, foreign_key: true, index: true
  end
end

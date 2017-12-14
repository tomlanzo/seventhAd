class AddWinnerToPlayers < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :winner, :boolean, null: :false, default: false
  end
end

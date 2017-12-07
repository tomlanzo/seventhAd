class AddScoreToPlayers < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :score, :integer, default: 0
    add_column :players, :time_taken, :integer, default: 0
  end
end

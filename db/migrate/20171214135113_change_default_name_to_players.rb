class ChangeDefaultNameToPlayers < ActiveRecord::Migration[5.1]
  def up
    change_column :players, :name, :string, default: nil, null: true
  end
  def down
    change_column :players, :name, :string, default: "Inconnu", null: false
  end
end

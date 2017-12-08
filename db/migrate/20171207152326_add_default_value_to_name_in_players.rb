class AddDefaultValueToNameInPlayers < ActiveRecord::Migration[5.1]
  def change
    change_column :players, :name, :string, default: "Inconnu"
  end
end

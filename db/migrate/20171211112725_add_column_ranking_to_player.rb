class AddColumnRankingToPlayer < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :ranking, :integer
  end
end

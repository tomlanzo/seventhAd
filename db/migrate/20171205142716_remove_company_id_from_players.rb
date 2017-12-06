class RemoveCompanyIdFromPlayers < ActiveRecord::Migration[5.1]
  def change
    remove_column :players, :company_id
  end
end

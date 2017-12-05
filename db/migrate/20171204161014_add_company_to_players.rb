class AddCompanyToPlayers < ActiveRecord::Migration[5.1]
  def change
    add_reference :players, :company, foreign_key: true
  end
end

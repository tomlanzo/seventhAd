class AlterCompanyEmail < ActiveRecord::Migration[5.1]
  def change
    change_column :companies, :email, :string, null: false, default: ""
  end
end

class AddCompanyToSessions < ActiveRecord::Migration[5.1]
  def change
    add_reference :sessions, :company, foreign_key: true
  end
end

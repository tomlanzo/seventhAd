class AddOpenedAtToSessions < ActiveRecord::Migration[5.1]
  def change
    add_column :sessions, :opened_at, :datetime
  end
end

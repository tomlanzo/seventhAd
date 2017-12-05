class RemoveStartAtFromSessions < ActiveRecord::Migration[5.1]
  def change
    remove_column :sessions, :start_at
  end
end

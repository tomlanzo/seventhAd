class RemoveCinemaFromSessions < ActiveRecord::Migration[5.1]
  def change
    remove_column :sessions, :cinema_id
  end
end

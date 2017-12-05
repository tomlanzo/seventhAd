class RemoveRoomFromSessions < ActiveRecord::Migration[5.1]
  def change
    remove_column :sessions, :room
  end
end

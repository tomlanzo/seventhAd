class AddOffsetToSessions < ActiveRecord::Migration[5.1]
  def change
    add_column :sessions, :offset, :integer
  end
end

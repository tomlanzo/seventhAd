class CreateSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :sessions do |t|
      t.string :room
      t.datetime :start_at
      t.integer :duration

      t.timestamps
    end
  end
end

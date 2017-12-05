class CreateSeances < ActiveRecord::Migration[5.1]
  def change
    create_table :seances do |t|
      t.string :room
      t.string :movie
      t.datetime :start_at
      t.references :cinema, foreign_key: true, index: true

      t.timestamps
    end
  end
end

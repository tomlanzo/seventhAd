class AddGameToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_reference :questions, :game, foreign_key: true
  end
end

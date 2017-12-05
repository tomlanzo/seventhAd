class AddPlayerToAnswers < ActiveRecord::Migration[5.1]
  def change
    add_reference :answers, :player, foreign_key: true
  end
end

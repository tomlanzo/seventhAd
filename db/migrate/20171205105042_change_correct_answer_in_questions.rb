class ChangeCorrectAnswerInQuestions < ActiveRecord::Migration[5.1]
  def change
    change_column :questions, :correct_answer, :integer, null: false
  end
end

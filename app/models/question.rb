class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :game
  validates :position, :duration, presence: true, numericality: true
  validates :title, :answer_1, :correct_answer, presence: true
  validates :correct_answer, inclusion: {
    in: [1, 2, 3, 4],
    message: "%{value} is not a given answer"
  }
end

class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :games
  validates :position, :duration, presence: true, numericality: true
  validates :title, :answer_1, :correct_answer, presence: true
end

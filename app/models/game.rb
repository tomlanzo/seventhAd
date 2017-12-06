class Game < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :game_sessions
  has_many :answers, through: :questions
end

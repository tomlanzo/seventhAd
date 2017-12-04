class Game < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :sessions
  has_many :answers, through: :questions
end

class Session < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :company
  belongs_to :cinema
  belongs_to :game
  validates :duration, presence: true, numericality: true
end

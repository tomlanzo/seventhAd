class GameSession < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :players
  belongs_to :company
  belongs_to :seance
  belongs_to :game
  validates :duration, presence: true, numericality: true

  def starting_at
    seance.start_at + offset.seconds
  end
end

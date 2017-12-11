class GameSession < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :players
  belongs_to :company
  belongs_to :seance
  belongs_to :game
  validates :duration, presence: true, numericality: true

  def starting_at
    seance.start_at + (offset || 0).seconds
  end

  def calculate_duration
    if !game.questions.nil?
      game.questions.each do |question|
        self.duration += question.duration
      end
    end
  end

  def ending_at
    seance.start_at + (offset || 0).seconds + (duration || 0).seconds
  end
end

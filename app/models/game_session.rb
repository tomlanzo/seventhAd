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
    if !self.game.questions.nil?
      self.game.questions.each do |question|
        self.duration += question.duration
      end
    end
  end

  def ending_at
    self.seance.start_at + (offset || 0).seconds + (duration || 0).seconds
  end

  def count_unsigned_players
    self.players.where(email: nil).count
  end

  def count_signed_players
    self.players.where.not(email: nil).count
  end

end

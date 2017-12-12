class GameSession < ApplicationRecord

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

  def calculate_ranking
    players_ordered = self.players.order(score: :desc, time_taken: :asc)
    i = 1
    players_ordered.each do |player|
      player.ranking = i
      i += 1
      player.save(validate: false)
    end
  end

end

class GameSession < ApplicationRecord

  has_many :players
  belongs_to :company
  belongs_to :seance
  belongs_to :game



  def update_session_start_end
    if !starting_at
      self.update(starting_at: start_at, ending_at: end_at,
                  duration: calculate_duration)
    end
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

  private

  def start_at
    seance.start_at + (offset_start || 0).seconds
  end

  def calculate_duration
    if !game.questions.nil?
      duration = 0
      game.questions.each do |question|
        duration += question.duration
      end
      duration + offset_end
    end
  end

  def end_at
     start_at + calculate_duration + (offset_end || 0).seconds
  end


end

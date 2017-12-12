class GameSession < ApplicationRecord

  has_many :players
  belongs_to :company
  belongs_to :seance
  belongs_to :game
  validates :duration, presence: true, numericality: true


  def update_session_start_end
    if !self.starting_at
      self.starting_at = start_at
      self.ending_at = end_at
      self.update
    end
  end


  private

  def start_at
    seance.start_at + (offset_start || 0).seconds
  end

  def calculate_duration
    if !game.questions.nil?
      game.questions.each do |question|
        self.duration += question.duration
      end
    end
  end

  def end_at
    # seance.starting_at + (offset_end || 0).seconds + (duration || 0).seconds
    starting_at + caltulate_duration + (self.offset_end || 0).seconds
  end

end

class GameSession < ApplicationRecord

  has_many :players
  belongs_to :company
  belongs_to :seance
  belongs_to :game
  enum status: {
    pending: 0,
    active: 1,
    finished: 2,
    closed: 3,
  }
  after_create :enqueue_job_opener
  before_validation(on: :create) do
    self.initialize_timestamps
  end

  def enqueue_job_opener
    self.initialize_timestamps
    ActivateGameSessionJob.perform_at(starting_at, id)
  end

  def initialize_timestamps
    self.calculate_duration
    self.update(starting_at: start_at, ending_at: end_at)
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

  def calculate_duration
    if !game.questions.nil?
      duration = 0
      game.questions.each do |question|
        duration += question.duration
      end
    end
    self.update(duration: duration)
  end

  def start_at
    seance.start_at + (offset_start || 0).seconds
  end

  def end_at
     start_at + duration + (offset_end || 0).seconds
  end
end

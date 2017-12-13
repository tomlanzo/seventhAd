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
  before_save :initialize_gs

  def enqueue_job_opener
    ActivateGameSessionJob.set(wait_until: starting_at).perform_later(id)
  end

  def initialize_gs
    self.starting_at = start_at
    self.ending_at = end_at
    self.duration = duration

    if starting_at.future?
      self.status = :pending
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

  def calculate_winners
    self.players.update(winner: false)
    winners = self.players.where.not(email: nil).order(ranking: :asc).first(3)
    winners.each do |player|
      player.winner = true
      player.save
    end
  end

  def count_unsigned_players
    self.players.where(email: nil).count
  end

  def count_signed_players
    self.players.where.not(email: nil).count
  end

  # private

  def duration
    if !game.questions.nil?
      duration = 0
      game.questions.each do |question|
        duration += question.duration
      end
    end

    duration
  end

  def start_at
    seance.start_at + (offset_start || 0).seconds
  end

  def end_at
     start_at + duration + (offset_end || 0).seconds
  end
end

class Seance < ApplicationRecord
  belongs_to :cinema
  has_many :game_sessions
  validates :room, :start_at, presence: true

  after_save :update_game_sessions_timestamps

  def update_game_sessions_timestamps
    game_sessions.each(&:save!)
  end
end

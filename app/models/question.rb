class Question < ApplicationRecord

  has_many :answers, dependent: :destroy
  belongs_to :game
  validates :position, :duration, presence: true, numericality: true
  validates :title, :answer_1, :correct_answer, presence: true
  validates :correct_answer, inclusion: {
    in: [1, 2, 3, 4],
    message: "%{value} is not a given answer"
  }
  has_attachment :photo


  def next_start_at(player)

    past_duration = Question.where(game: player.game_session.game,
                    position: [0..position]).sum(:duration)

    player.game_session.starting_at + past_duration

  end
end


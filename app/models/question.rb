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


  def redirect_path (player)
    next_question = Question.where(game: self.game,
                     position: self.position += 1)

    if next_question.empty?
       edit_player_path(player)
    else
       player_question_path(player, next_question.first.id)
    end
  end

  def next_start_at (player)
   player.game_session.starting_at + self.duration
  end
end

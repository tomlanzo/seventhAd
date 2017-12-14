class Player < ApplicationRecord

  include Rails.application.routes.url_helpers

  has_many :answers, dependent: :destroy
  belongs_to :game_session
  validates :token, presence: true
  validates :email, presence: true, email: true, if: :persisted?
  validates :name, presence: true, if: :persisted?
  validates :ranking, numericality: true, allow_nil: true


  before_validation(on: :create) do
    self.token = SecureRandom.uuid
  end

  def calculate_score
    if !answers.nil? && score.zero?
      answers.each do |answer|
        if answer.correct
          self.time_taken += (answer.created_at.to_i - game_session.starting_at.to_i)
          self.score += 1
        end
      end

      save(validate: false)
    end
  end

  def next_page_path(question)
    next_position = if question.new_record? #if player.game_session.status == 0
      1
    else
      question.position + 1
    end

    next_question = Question \
      .where(game: question.game, position: next_position) \
      .order(:position) \
      .limit(1) \
      .first

    if next_question.nil?
       edit_player_path(id)
    else
       player_question_path(id, next_question.id)
    end
  end

  # def next_page
  #   if game_session.pending?
  #     next_page = Question.where(game: game_session.game, position: 1)
  #   elsif game_session.active?
  #     if DateTime.now

  #     next_question = Question.where(game: question.game,
  #                     position: question.position += 1)
  #   end

  #   if next_question.empty?
  #      edit_player_path(id)
  #   else
  #      player_question_path(id, next_question.first.id)
  #   end
  # end

end

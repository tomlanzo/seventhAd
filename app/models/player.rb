class Player < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :game_session
  validates :token, presence: true
  validates :email, presence: true, email: true, if: :persisted?
  validates :name, presence: true, if: :persisted?
  validates :ranking, numericality: true


  before_validation(on: :create) do
    self.token = SecureRandom.uuid
  end
  def calculate_score
    if !answers.nil? && score.zero?
      answers.each do |answer|
        if answer.correct
          self.time_taken += answer.created_at.to_i
          self.score += 1
        end
      end

      save(validate: false)
    end
  end
end

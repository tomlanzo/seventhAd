class Player < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :game_session
  validates :token, presence: true
  validates :email, :name, presence: true, if: :persisted?

  before_validation(on: :create) do
    self.token = SecureRandom.uuid
  end
end

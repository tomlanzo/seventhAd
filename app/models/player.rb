class Player < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :session
  validates :token, presence: true
  validates :email, :name, presence: true, if: :persisted?
end

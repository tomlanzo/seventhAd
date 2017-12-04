class Player < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :company
  validates :token, presence: true
  validates :email, presence: true, if: :persisted?
end

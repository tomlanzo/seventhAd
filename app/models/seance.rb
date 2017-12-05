class Seance < ApplicationRecord
  belongs_to :cinema
  has_many :sessions
  validates :room, :start_at, presence: true
end

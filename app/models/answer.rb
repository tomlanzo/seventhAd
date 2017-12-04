class Answer < ApplicationRecord
  belongs_to :player
  belongs_to :question
  belongs_to :session
  validates :choice, presence: true, numericality: true
end

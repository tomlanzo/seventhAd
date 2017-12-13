class Answer < ApplicationRecord
  belongs_to :player
  belongs_to :question
  validates :choice, presence: true, inclusion: {
    in: [1, 2, 3, 4],
    message: "%{value} is not a given answer"
  }
end

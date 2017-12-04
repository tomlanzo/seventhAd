class Cinema < ApplicationRecord
  has_many :sessions
  validates :name, :address, presence: true
end

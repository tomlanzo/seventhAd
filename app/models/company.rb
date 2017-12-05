class Company < ApplicationRecord
  has_many :sessions, dependent: :destroy
  has_many :players, dependent: :destroy
  has_many :cinemas, through: :sessions
  has_many :games, through: :sessions
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true
end

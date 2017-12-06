class Company < ApplicationRecord
  has_many :sessions, dependent: :destroy
  has_many :players, through: :sessions
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true
end

class Cinema < ApplicationRecord
  has_many :seances
  validates :name, :address, presence: true
end

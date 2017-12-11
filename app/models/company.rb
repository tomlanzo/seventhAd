class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :game_sessions, dependent: :destroy
  has_many :players, through: :sessions
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true
  has_attachment :photo


end

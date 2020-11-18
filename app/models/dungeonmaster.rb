class Dungeonmaster < ApplicationRecord

  belongs_to :user
  has_many :campaigns
  has_many :parties, through: :campaigns
  has_many :players, through: :parties
  validates :name, presence: true

end

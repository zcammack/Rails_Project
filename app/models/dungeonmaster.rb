class Dungeonmaster < ApplicationRecord

  belongs_to :user
  has_many :campaigns
  has_many :partys, through: :campaigns
  has_many :players, through: :partys
  validates :name, presence: true

end

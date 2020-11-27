class Character < ApplicationRecord
    belongs_to :party
    belongs_to :user
    has_many :campaigns, through: :parties
    validates :name, presence: true
    validates :level, presence: true, numericality: true
    validates :profession, presence: true
end

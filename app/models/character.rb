class Character < ApplicationRecord
    belongs_to :party
    belongs_to :user
    validates :name, presence: true
    validates :level, presence: true, numericality: true
    validates :profession, presence: true
end

class Character < ApplicationRecord
    has_many :levels
    has_many :parties, through: :levels
    validates :first_name, presence: true
    validates :last_name, presence: true
end

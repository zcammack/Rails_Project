class Level < ApplicationRecord
    has_many :characters
    has_many :parties, through: :characters
end

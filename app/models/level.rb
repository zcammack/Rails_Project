class Level < ApplicationRecord
    has_many :characters
    has_many :partys, through: :characters
end

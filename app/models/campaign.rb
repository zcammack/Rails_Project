class Campaign < ApplicationRecord
    has_many :characters
    belongs_to :user
    belongs_to :dungeonmaster
end

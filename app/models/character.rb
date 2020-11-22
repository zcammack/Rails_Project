class Character < ApplicationRecord
    belongs_to :party
    validates :name, presence: true
    validates :class, presence: true
    validates :level, presence: true
end

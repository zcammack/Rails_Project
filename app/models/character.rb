class Character < ApplicationRecord
    belongs_to :campaign
    validates :first_name, presence: true
    validates :last_name, presence: true
end

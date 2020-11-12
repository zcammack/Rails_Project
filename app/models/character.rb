class Character < ApplicationRecord
    belongs_to :campaign
    belongs_to :user
    validates :first_name, presence: true
    validates :last_name, presence: true
end

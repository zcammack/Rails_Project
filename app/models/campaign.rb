class Campaign < ApplicationRecord
    belongs_to :user
    has_many :parties
    has_many :characters, through: :parties
    accepts_nested_attributes_for :parties
    #validates :title, presence: true
    #validates :description, presence: true

    scope :biggest_to_smallest, -> { order("number_of_parties desc") }
end

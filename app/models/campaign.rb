class Campaign < ApplicationRecord
    has_many :partys
    belongs_to :dungeonmaster
    accepts_nested_attributes_for :partys
    validates :title, presence: true
    validates_numericality_of :number_of_parties
    validates :setting, presence: true
    validates :description, presence: true

    scope :biggest_to_smallest, -> { order("number_of_parties desc") }
end

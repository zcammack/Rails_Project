class Party < ApplicationRecord
    belongs_to :campaign
    has_many :players
    has_many :characters
    has_many :levels, through: :characters
    validates :title, presence: true
    validates_uniqueness_of :title, scope: :campaign_id
    validates_numericality_of :size
    accepts_nested_attributes_for :characters


end

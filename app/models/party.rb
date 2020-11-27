class Party < ApplicationRecord
	belongs_to :campaign
    has_many :characters
    validates :name, presence: true
    validates_uniqueness_of :name, scope: :campaign_id

    scope :parties_with_4_or_more, -> { where("party.size >= ?", 4)}

end

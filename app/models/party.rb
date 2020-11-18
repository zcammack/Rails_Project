class Party < ApplicationRecord
    belongs_to :campaign
    has_many :players
    has_many :characters
    has_many :levels, through: :characters
    validates :name, presence: true
    validates_uniqueness_of :name, scope: :campaign_id
    accepts_nested_attributes_for :characters

    scope :parties_with_4_or_more, -> { where("party.size >= ?", 4)}


    def characters_attributes=(character_attributes)
		character_attributes.values.each do |character_attribute|
		  if character_attribute[:first_name].present?
		  	character = Character.find_or_create_by(character_attribute)
		  	self.characters << character
		  end
		end
	end

end

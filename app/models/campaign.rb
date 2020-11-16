class Campaign < ApplicationRecord
    has_many :characters
    belongs_to :user
    belongs_to( 
        :creator,
        class_name: 'Dungeonmaster',
        foreign_key: 'dungeonmaster_id',
        inverse_of: :campaigns
    )
end

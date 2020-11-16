class Character < ApplicationRecord
    belongs_to :campaign
    belongs_to( 
        :creator,
        class_name: 'User',
        foreign_key: 'user_id',
        inverse_of: :characters
    )
    validates :first_name, presence: true
    validates :last_name, presence: true
end

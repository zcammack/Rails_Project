class Dungeonmaster < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many( 
    :campaigns,
    class_name: 'Campaign',
    foreign_key: 'dungeonmaster_id',
    inverse_of: :creator
  )
  has_many :users, through: :campaigns
end

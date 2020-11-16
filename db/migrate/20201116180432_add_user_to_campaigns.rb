class AddUserToCampaigns < ActiveRecord::Migration[6.0]
  def change
    add_reference :campaigns, :user, foreign_key: true
  end
end

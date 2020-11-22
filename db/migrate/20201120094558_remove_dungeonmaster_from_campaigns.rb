class RemoveDungeonmasterFromCampaigns < ActiveRecord::Migration[6.0]
  def change
    remove_column :campaigns, :dungeonmaster_id
  end
end

class CreateCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :campaigns do |t|
      t.string :title
      t.text :description
      t.string :setting
      t.string :dungeonmaster

      t.timestamps
    end
  end
end

class CreateParty < ActiveRecord::Migration[6.0]
  def change
    create_table :parties do |t|
      t.string :name
      t.integer :campaign_id
      t.integer :size
      t.string  :description

      t.timestamps
    end
  end
end

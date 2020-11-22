class CreateCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :campaigns do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.integer :number_of_parties

      t.timestamps
    end
  end
end

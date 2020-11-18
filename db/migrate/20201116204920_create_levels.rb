class CreateLevels < ActiveRecord::Migration[6.0]
  def change
    create_table :levels do |t|
      t.integer :party_id
      t.integer :character_id

      t.timestamps
    end
  end
end

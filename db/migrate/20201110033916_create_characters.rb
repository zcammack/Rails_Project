class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :class
      t.string :level
      
      t.timestamps
    end
  end
end

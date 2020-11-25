class RemoveCharIdFromParties < ActiveRecord::Migration[6.0]
  def change
    remove_column :parties, :character_id
  end
end

class RemoveCharacterIdFromParty < ActiveRecord::Migration[6.0]
  def change
    remove_column :parties, :charcter_id
  end
end

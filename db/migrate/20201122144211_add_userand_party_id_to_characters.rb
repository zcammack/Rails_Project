class AddUserandPartyIdToCharacters < ActiveRecord::Migration[6.0]
  def change
    add_column :characters, :user_id, :integer
    add_column :characters, :party_id, :integer
  end
end

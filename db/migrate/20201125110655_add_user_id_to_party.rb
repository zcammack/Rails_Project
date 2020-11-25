class AddUserIdToParty < ActiveRecord::Migration[6.0]
  def change
    add_column :parties, :user_id, :integer
  end
end

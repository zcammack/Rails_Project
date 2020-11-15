class AddUserIdToCharacters < ActiveRecord::Migration[6.0]
  def change
    add_reference :characters, :user, index: true
    add_foreign_key :characters, :users
  end
end

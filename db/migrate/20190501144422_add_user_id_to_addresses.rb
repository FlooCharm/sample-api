class AddUserIdToAddresses < ActiveRecord::Migration[5.2]
  def up
  	add_column :addresses, :user_id, :integer
  end

  def down
  	remove_column :addresses, :user_id
  end
end

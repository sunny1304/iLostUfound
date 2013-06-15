class AddUserIdToLostAndFoundItems < ActiveRecord::Migration
  def change
  	add_column :lost_items, :user_id , :integer
  	add_column :found_items, :user_id , :integer
  end
end

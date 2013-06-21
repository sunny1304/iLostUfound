class AddStatusToLostAndFoundItems < ActiveRecord::Migration
  def change
  	add_column :lost_items,  :found, :boolean, :default => false
  	add_column :found_items, :found, :boolean, :default => false
  end
end

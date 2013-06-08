class AddLostDateToLostItems < ActiveRecord::Migration
  def change
  	remove_column :lost_items, :lost_date
  	add_column :lost_items, :lost_date, :datetime 
  end
end

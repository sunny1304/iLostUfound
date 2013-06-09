class AddDescriptionToLostAndFound < ActiveRecord::Migration
  def change
  	add_column :lost_items,  :description, :string
  	add_column :found_items, :description, :string
  end
end

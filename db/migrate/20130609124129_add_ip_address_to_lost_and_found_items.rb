class AddIpAddressToLostAndFoundItems < ActiveRecord::Migration
  def change
  	add_column :lost_items,  :ip_address, :string
  	add_column :found_items, :ip_address, :string
  end
end

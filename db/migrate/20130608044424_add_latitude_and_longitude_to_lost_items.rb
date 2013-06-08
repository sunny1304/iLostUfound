class AddLatitudeAndLongitudeToLostItems < ActiveRecord::Migration
  def change
    add_column :lost_items, :latitude, :float
    add_column :lost_items, :longitude, :float
  end
end

class AddGeocodeToFoundItems < ActiveRecord::Migration
  def change
    add_column :found_items, :longitude, :float
    add_column :found_items, :latitude, :float
  end
end

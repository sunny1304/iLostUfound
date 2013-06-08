class CreateFoundItems < ActiveRecord::Migration
  def change
    create_table :found_items do |t|
      t.string :name
      t.string :address
      t.string :cell
      t.string :found_item
      t.string :found_location
      t.datetime :found_date
      t.string :found_item_pic
      t.string :email
      t.string :additional_contact

      t.timestamps
    end
  end
end

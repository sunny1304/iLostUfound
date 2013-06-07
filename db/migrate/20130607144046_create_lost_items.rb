class CreateLostItems < ActiveRecord::Migration
  def change
    create_table :lost_items do |t|
      t.string :name
      t.string :address
      t.string :cell
      t.string :lost_item
      t.string :lost_location
      t.datetime :lost_date
      t.string :lost_item_pic
      t.string :email
      t.string :additional_contct

      t.timestamps
    end
  end
end

class LostItem < ActiveRecord::Base
  attr_accessible :additional_contct, :address, :cell, :email, :lost_date, :lost_item, :lost_item_pic, :lost_location, :name
  mount_uploader :lost_item_pic, LostItemPicUploader
end

class LostItem < ActiveRecord::Base
  attr_accessible :additional_contact, :address, :cell, :email, :lost_date, :lost_item, :lost_item_pic, :lost_location, :name, :latitude, :longitude,:description
  validates_presence_of :name, :address, :cell, :lost_item, :lost_location, :lost_date, :email

  geocoded_by :lost_location
  after_validation :geocode, :if => :lost_location_changed?
  mount_uploader  :lost_item_pic, LostItemPicUploader
end

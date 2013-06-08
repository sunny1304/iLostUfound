class FoundItem < ActiveRecord::Base
  attr_accessible :additional_contact, :address, :cell, :email, :found_date, :found_item, :found_item_pic, :found_location, :name,:longitude,:latitude
  geocoded_by :found_location
  after_validation :geocode, :if => :found_location_changed?
  mount_uploader  :found_item_pic, FoundItemPicUploader
end

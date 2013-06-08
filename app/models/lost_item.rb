class LostItem < ActiveRecord::Base
  attr_accessible :additional_contact, :address, :cell, :email, :lost_date, :lost_item, :lost_item_pic, :lost_location, :name, :latitude, :longitude
  geocoded_by :lost_location
  after_validation :geocode, :if => :lost_location_changed?
end

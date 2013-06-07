class LostItem < ActiveRecord::Base
  attr_accessible :additional_contact, :address, :cell, :email, :lost_date, :lost_item, :lost_item_pic, :lost_location, :name
end

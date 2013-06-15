class WelcomeController < ApplicationController
  def index
  	# visitor_ip = request.ip
  	# @lost_report_count = LostItem.where("ip_address=?",visitor_ip).pluck(:id).count
  	# @lost_item_ids = LostItem.where("ip_address=?",visitor_ip).select([:id,:lost_item]) if @lost_report_count > 0

  	# @found_report_count = FoundItem.where("ip_address=?",visitor_ip).pluck(:id).count
  	# @found_item_ids = FoundItem.where("ip_address=?",visitor_ip).select([:id,:found_item]) if @found_report_count > 0
  	@lost_report_count = (user_signed_in?)? current_user.lost_items.count : 0
  	@lost_items_ids = LostItem.where("user_is =?",current_user.id).select([:id,:lost_item]) if user_signed_in?

  	@found_report_count = (user_signed_in?)? current_user.found_items.count : 0
  	@found_report_ids = FoundItem.where("user_id =?",current_user.id).select([:id,:found_item]) if user_signed_in?

  end

end

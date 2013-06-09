class WelcomeController < ApplicationController
  def index
  	visitor_ip = request.ip
  	@lost_report_count = LostItem.where("ip_address=?",visitor_ip).pluck(:id).count
  	@lost_item_ids = LostItem.where("ip_address=?",visitor_ip).pluck(:id) if @lost_report_count > 0

  	@found_report_count = FoundItem.where("ip_address=?",visitor_ip).pluck(:id).count
  	@found_item_ids = FoundItem.where("ip_address=?",visitor_ip).pluck(:id) if @found_report_count > 0

  end

end

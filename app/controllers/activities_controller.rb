class ActivitiesController < ApplicationController
	before_filter :authenticate_user!
  def index
  	@last_login = current_user.last_sign_in_at.to_date
  	@lost_report_count = get_lost_reports.count
  	@found_report_count = get_found_reports.count
  end

  def get_lost_reports
  	@lost_reports = LostItem.where("user_id =?",current_user.id).pluck(:id)
  end

  def get_found_reports
  	@found_items = FoundItem.where("user_id =?",current_user.id).pluck(:id)
  end

  def sent_mail_to_user
  end

  def user_sent_mail
  end

end

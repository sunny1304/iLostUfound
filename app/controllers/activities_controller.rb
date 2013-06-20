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

  def profile_picture_upload
    if params[:user].present?
      if current_user.update_attributes(params[:user])
        # redirect_to root_url
        logger.debug "pic uploaded"
      end
    end
    respond_to do |format|
      format.html{redirect_to request.referer, :alert => "picture has been uploaded"}
      format.js
    end
  end

end

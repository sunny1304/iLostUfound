class LostFound < ActionMailer::Base
  default from: "sunny1304.ad@gmail.com"

  def find_notification(found_item)
  	@found_item = found_item
  	mail(:to => @found_item.email, :subject => "found item notification")
  end

  def lost_notification(lost_item)
  	@lost_item = lost_item
  	mail(:to => @lost_item.email, :subject => "lost item notification")
  end

end


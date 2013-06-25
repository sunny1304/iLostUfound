module FoundItemsHelper
	def pic_on_comment(id)
		if id.present?
			user = User.find(id)
			if user.profile_pic.url.present?
				image_tag user.profile_pic.mini.url
			else
				gravatar_mini
			end
		else
			gravatar_mini
		end
	end

	def is_reporter_of_found_item?(id)
    	current_user.found_items.collect(&:id).include?(id)
	end

end

module LostItemsHelper
	def pic_on_comment(id)
			if id.present?
				user = User.find(id)
				if user.profile_pic.present?
					image_tag user.profile_pic.mini.url
				else
					gravatar_mini
				end
			else
				gravatar_mini
			end
	end

end

module ApplicationHelper
	def check_vowel(name)
		vowels = %w(a e i o u)
		(vowels.include?(name.to_s.first.downcase))? "an" : "a"
	end

	def process_item_name(lost_item)
		lost_item_array = lost_item.split(" ")
		if lost_item_array.count > 1
			first_word,*rest = lost_item_array
			(%w(a an).include?(first_word))? rest.join(" ") : lost_item
		else
			lost_item
		end
	end
end

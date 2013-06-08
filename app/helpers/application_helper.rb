module ApplicationHelper
	def check_vowel(name)
		vowels = %w(a e i o u)
		name_array = name.split(" ")
		if name_array.count > 1
			first_word, *rest = name_array
			if %w(a an).include?(first_word.first.downcase)
				(vowels.include?(rest.first.downcase))? "an" : "a"
			else
				(vowels.include?(first_word.first.downcase))? "an" : "a"
			end
		else
			(vowels.include?(name.first.downcase))? "an" : "a"
		end
	end

	def process_item_name(item)
		item_array = item.split(" ")
		if item_array.count > 1
			first_word,*rest = item_array
			(%w(a an).include?(first_word))? rest.join(" ") : item
		else
			item
		end
	end
end

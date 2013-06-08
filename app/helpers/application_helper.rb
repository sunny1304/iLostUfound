module ApplicationHelper
	def check_vowel(name)
		vowels = %w(a e i o u)
		(vowels.include?(name.to_s.first.downcase))? "an" : "a"
	end
end

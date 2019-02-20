class PhoneNumberToWords
	def number_to_letters(digits)
		return [] if digits.nil? || digits.length != 10 || (digits.include? "1") || (digits.include? "0")
		characters = {"a" => "2","b" => "2","c" => "2","d" => "3", "e" => "3","f" => "3","g" => "4","h" => "4","i" => 4,"j" => "5","k" => "5", "l" => "5","m" => "6", "n" => "6","o" => "6","p" => "7","q" => "7","r" => "7", "s" => "7", "t" => "8", "u" => "8",  "v" => "8", "w" => "9", "x" => "9","y" => "9", "z" => "9"}
		file_path = '/home/tech/Documents/dictionary.txt'
		hash = Hash.new{|h,k| h[k] = [] }
		File.foreach( file_path ) do |word|
			variable = word.chop.to_s.downcase
			if variable.length >= 3 and digits.include? (variable.chars.map{|x| characters[x]}.join(""))
				hash[variable.chars.map{|x| characters[x]}.join("")].push(variable)  
			end
		end
		final_words = []
		for i in (0..hash.keys.length) do
			for j in (i+1..hash.keys.length) do
				if hash.keys[i].to_s + hash.keys[j].to_s == digits
					first_array = []
					second_array = []
					first_array = hash[hash.keys[i].to_s]
					second_array = hash[hash.keys[j].to_s]
					if !first_array.empty? and !second_array.empty?
						first_array.each{|x|
							second_array.each{|y|
							array = []
							array.push(x)
							array.push(y)
							final_words.push(array)
							}
						}
					elsif !first_array.empty? and second_array.empty?
						first_array.each{|x|
						final_words.push(x)
						}
					elsif first_array.empty? and !second_array.empty?
						second_array.each{|x|
						final_words.push(x)
						}
					end
				end
			end
		end
		return final_words.uniq
	end
end
final_words = PhoneNumberToWords.new().number_to_letters("6686787825")
print final_words

final_words = PhoneNumberToWords.new().number_to_letters("2282668687")
print final_words
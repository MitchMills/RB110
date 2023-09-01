def letter_changes(string)
  uppercase = ('A'..'Z').to_a
  lowercase = ('a'..'z').to_a
  shifted_uppercase = ('D'..'Z').to_a + ('A'..'C').to_a
  shifted_lowercase = ('d'..'z').to_a + ('a'..'c').to_a
  string.chars.map do |char|
    if uppercase.include?(char)
      index = uppercase.index(char)
      shifted_uppercase[index]
    elsif lowercase.include?(char)
      index = lowercase.index(char)
      shifted_lowercase[index]
    else
      char
    end
  end.join
end



def letter_changes(string)
  uppercase = ('A'..'Z').to_a
  lowercase = ('a'..'z').to_a
  string.chars.map do |char|
    if uppercase.include?(char)
      index = uppercase.index(char)
      uppercase.rotate(3)[index]
    elsif lowercase.include?(char)
      index = lowercase.index(char)
      lowercase.rotate(3)[index]
    else
      char
    end
  end.join
end


p letter_changes("this long cake@&") == "wklv orqj fdnh@&"
p letter_changes("Road trip9") == "Urdg wuls9"
p letter_changes("EMAILZ@gmail.com") == "HPDLOC@jpdlo.frp"
p letter_changes('xyz') == ('abc')


##### VOWEL SUBSTRINGS
# VOWELS = %w(a e i o u)

# def count_vowel_substrings(string)
#   all_substrings = (0..string.size - 5).map do |start_index|
#     (5..string.size - start_index).map do |length|
#       string[start_index, length]
#     end
#   end.flatten

#   p all_substrings
  
#   vowel_only_substrings = all_substrings.select do |substring|
#     substring.chars.all? do |char|
#         VOWELS.include?(char)
#     end
#   end

#   vowel_substrings = vowel_only_substrings.select do |substring|
#     VOWELS.all? do |vowel|
#         substring.include?(vowel)
#     end
#   end.size
# end

### With Helper Methods
# VOWELS = %w(a e i o u)

# def count_vowel_substrings(string)
#   all_substrings = get_all_substrings(string)
#   vowel_substrings = filter_substrings(all_substrings)
#   vowel_substrings.size
# end

# def get_all_substrings(string)
#   (0..string.size - 5).map do |start_index|
#     get_all_lengths(string, start_index)
#   end.flatten
# end

# def get_all_lengths(string, start_index)
#   (5..string.size - start_index).map do |length|
#     string[start_index, length]
#   end
# end

# def filter_substrings(all_substrings)
#   vowel_only_substrings = get_vowel_only_substrings(all_substrings)
#   vowel_substrings = get_vowel_substrings(vowel_only_substrings)
# end

# def get_vowel_only_substrings(array)
#   array.select do |substring|
#     substring.chars.all? do |char|
#         VOWELS.include?(char)
#     end
#   end
# end

# def get_vowel_substrings(array)
#   array.select do |substring|
#     VOWELS.all? do |vowel|
#         substring.include?(vowel)
#     end
#   end
# end
###
### ESTHER I
# def count_vowel_substrings(string)
#   counter = 0

#   5.upto(string.size) do |length|
#     string.chars.each_cons(length) do |chars_arr|
#       all_vowels = chars_arr.all? { |char| %w(a e i o u).include?(char) }
#       counter += 1 if all_vowels && chars_arr.uniq.size == 5
#     end
#   end

#   counter
# end
###

### ESTHER II
# def count_vowel_substrings(string)
#   counter = 0

#   0.upto(string.size - 5) do |start_idx|
#     5.upto(string[start_idx..-1].size) do |length|
#       substring = string[start_idx, length]
#       all_vowels = substring.chars.all? { |char| %w(a e i o u).include?(char) }
#       uniq_chars = substring.chars.sort.join.squeeze
#       counter += 1 if all_vowels && uniq_chars.size == 5
#     end
#   end

#   counter
# end
###

### ESTHER III
# def count_vowel_substrings(string)
#   vowel_substrings = []

#   0.upto(string.size - 5) do |start_idx|
#     current_idx = start_idx

#     while current_idx < string.size
#       break unless %w(a e i o u).include?(string[current_idx])

#       substring = string[start_idx..current_idx]
#       vowel_substrings << substring if substring.chars.uniq.size == 5
#       current_idx += 1
#     end

#     next
#   end

#   vowel_substrings.size
# end
###

### SHAWN
# def count_vowel_substrings(string)
#   substring_array = []
#   0.upto(string.size - 1) do |outer_idx|
#     outer_idx.upto(string.size - 1) do |inner_idx|

#       if %w(a e i o u).all? { |vowel| string[outer_idx..inner_idx].count(vowel) >= 1 }
#         if string[outer_idx..inner_idx].delete('^aeiou') == string[outer_idx..inner_idx]
#           substring_array << string[outer_idx..inner_idx]
#         end
#       end

#     end
#   end
  
#   substring_array.size
# end

# p count_vowel_substrings("abcde") == 0
# p count_vowel_substrings("cuaieuouac") == 7
# p count_vowel_substrings("aeiouu") == 2
# p count_vowel_substrings("unicornarihan") == 0



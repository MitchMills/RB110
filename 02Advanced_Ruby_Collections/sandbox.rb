def letter_changes(string)

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

# p count_vowel_substrings("abcde") == 0
# p count_vowel_substrings("cuaieuouac") == 7
# p count_vowel_substrings("aeiouu") == 2
# p count_vowel_substrings("unicornarihan") == 0

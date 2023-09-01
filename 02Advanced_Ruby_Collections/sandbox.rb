# def count_vowel_substrings(string)
#   vowels = %w(a e i o u)
#   non_vowels = ('a'..'z').to_a - vowels

#   all_substrings = (0..string.size - 5).map do |start_index|
#     next [] if non_vowels.include?(string[start_index])
#     (5..string.size - start_index).map do |length|
#       string[start_index, length]
#     end
#   end.flatten
  
#   vowel_only_substrings = all_substrings.select do |substring|
#     substring.chars.all? do |char|
#         vowels.include?(char)
#     end
#   end

#   vowel_substrings = vowel_only_substrings.select do |substring|
#     vowels.all? do |vowel|
#         substring.include?(vowel)
#     end
#   end.size
# end

def count_vowel_substrings(string)
  vowels = %w(a e i o u)
  non_vowels = ('a'..'z').to_a - vowels

  all_substrings = (0..string.size - 5).map do |start_index|
    next [] if non_vowels.include?(string[start_index])
    (5..string.size - start_index).map do |length|
      string[start_index, length]
    end
  end.flatten
  
  vowel_only_substrings = all_substrings.select do |substring|
    substring.chars.all? do |char|
        vowels.include?(char)
    end
  end

  vowel_substrings = vowel_only_substrings.select do |substring|
    vowels.all? do |vowel|
        substring.include?(vowel)
    end
  end.size
end






p count_vowel_substrings("abcde") == 0
p count_vowel_substrings("cuaieuouac") == 7
p count_vowel_substrings("aeiouu") == 2
p count_vowel_substrings("unicornarihan") == 0

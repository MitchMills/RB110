def count_vowel_substrings(string)
  vowels = %w(a e i o u)
  non_vowels = ('a'..'z').to_a - vowels

  all_substrings = (0..string.size - 5).map do |start_index|
    next [] if non_vowels.include?(string[start_index])
    (5..string.size - start_index).map do |length|
      string[start_index, length]
    end
  end
  
  vowel_only_substrings = all_substrings.select do |array|
    array.select do |string|

      result = string.chars.all? do |char|
        vowels.include?(char)
      end
      p result
    end
    array.size > 0
  end
  p vowel_only_substrings
end



# [
#   [], 
#   ["uaieu", "uaieuo", "uaieuou", "uaieuoua", "uaieuouac"], 
#   ["aieuo", "aieuou", "aieuoua", "aieuouac"], 
#   ["ieuou", "ieuoua", "ieuouac"], 
#   ["euoua", "euouac"], 
#   ["uouac"]
# ]

# p count_vowel_substrings("abcde") == 0
count_vowel_substrings("cuaieuouac")# == 7
# p count_vowel_substrings("aeiouu") == 2
# p count_vowel_substrings("unicornarihan") == 0

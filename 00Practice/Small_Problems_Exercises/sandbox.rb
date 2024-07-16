VOWELS = %w(a e i o u)

def longest_vowel_substring(string)
  substrings = get_substrings(string)
  vowels_only = substrings.select do |substring|
    substring.chars.all? { |char| VOWELS.include?(char) }
  end
  lengths = vowels_only.map(&:size)
  lengths.max || 0
end

def get_substrings(string)
  substrings = []
  min_length = 1
  last_index = string.size - min_length
  start_indexes = (0..last_index)

  start_indexes.each do |start_index|
    max_length = string.size - start_index
    lengths = (min_length..max_length)

    lengths.each do |length|
      substrings << string[start_index, length]
    end
  end
  substrings
end

p longest_vowel_substring('cwm') == 0
p longest_vowel_substring('many') == 1
p longest_vowel_substring('launchschoolstudents') == 2
p longest_vowel_substring('eau') == 3
p longest_vowel_substring('beauteous') == 3
p longest_vowel_substring('sequoia') == 4
p longest_vowel_substring('miaoued') == 5

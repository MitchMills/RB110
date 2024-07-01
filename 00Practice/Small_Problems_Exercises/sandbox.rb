def longest_vowel_substring(string)
  substrings = get_substrings(string)
  vowel_substrings = substrings.select do |substring|
    substring.each_char.all? { |char| 'aeiou'.include?(char) }
  end
  largest = vowel_substrings.max_by(&:size) || ''
  largest.size
end

def get_substrings(string)
  substrings = []
  final_index = string.size - 1

  (0..final_index).each do |start_index|
    max_length = string.size - start_index

    (1..max_length).each do |length|
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

VOWELS = %w(a e i o u)

def count_vowel_substrings(string)
  substrings = get_substrings(string)
  vowels_only_substrings = get_vowels_only_substrings(substrings)
  vowel_substring_count(vowels_only_substrings)
end

def get_substrings(string)
  substrings = []
  min_length = 5
  last_index = (string.size - min_length)
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

def get_vowels_only_substrings(substrings)
  substrings.select do |substring|
    substring.chars.all? { |char| VOWELS.include?(char) }
  end
end

def vowel_substring_count(vowels_only_substrings)
  vowels_only_substrings.count do |substring|
    VOWELS.all? { |vowel| substring.include?(vowel) }
  end
end

p count_vowel_substrings('abcde') == 0
p count_vowel_substrings('aeiou') == 1
p count_vowel_substrings('iaoue') == 1
p count_vowel_substrings('aeiogu') == 0
p count_vowel_substrings('aeiouu') == 2
p count_vowel_substrings('aeiouuu') == 3
p count_vowel_substrings('aaeeiioouu') == 4

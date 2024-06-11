def count_vowel_substrings(string)
  vowels = 'aeiou'
  all_substrings = get_all_substrings(string)
  vowels_only_substrings = get_vowels_only_substrings(all_substrings, vowels)
  vowel_substrings = get_vowel_substrings(vowels_only_substrings, vowels)
  vowel_substrings.size
end

def get_all_substrings(string)
  last_index = string.size - 5
  max_length = string.size
  (0..last_index).each_with_object([]) do |start_index, substrings|
    (5..max_length).each do |length|
      substrings << string[start_index, length]
    end
  end
end

def get_vowels_only_substrings(substrings, vowels)
  substrings.select do |substring|
    substring.chars.all? { |char| vowels.include?(char) }
  end
end

def get_vowel_substrings(vowels_only, vowels)
  vowels_only.select do |substring|
    vowels.chars.all? { |vowel| substring.include?(vowel) }
  end
end

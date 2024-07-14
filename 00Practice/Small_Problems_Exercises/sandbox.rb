def substring_twice?(string1, string2)
  shorter, longer = [string1, string2].sort_by(&:size).map(&:downcase)
  substrings = get_substrings(shorter, longer)
  substrings.size > 0
end

def get_substrings(string1, string2)
  substrings = []
  min_length = 2
  last_index = string1.size - min_length
  start_indexes = (0..last_index)

  start_indexes.each do |start_index|
    max_length = string1.size - start_index
    lengths = (min_length..max_length)

    lengths.each do |length|
      substring = string1[start_index, length]
      substrings << substring if same_substring?(substring, string2)
    end
  end

  substrings
end

def same_substring?(substring, string)
  string.include?(substring)
end

p substring_twice?('face', 'Ace') == true
p substring_twice?('face', 'ACTUALLY') == true
p substring_twice?('face', 'gave') == false
p substring_twice?('aa', 'aa') == true

def substring_twice?(string1, string2)
  substrings = get_substrings(string1)
  substrings.any? { |substring| string2.downcase.include?(substring) }
end

def get_substrings(string)
  substrings = []
  last_index = string.size - 2

  (0..last_index).each do |start_index|
    max_length = string.size - start_index

    (2..max_length).each do |length|
      substrings << string.downcase[start_index, length]
    end
  end
  substrings
end

p substring_twice?('face', 'Ace') == true
p substring_twice?('face', 'ACTUALLY') == true
p substring_twice?('face', 'gave') == false
p substring_twice?('aa', 'aa') == true

def count_substrings(string1, string2)
  substrings = get_substrings(string1, string2.size)
  matches = substrings.select { |substring| substring == string2 }
  matches.size
end

def get_substrings(string, length)
  last_index = string.size - length
  (0..last_index).map { |start_index| string[start_index, length] }
end

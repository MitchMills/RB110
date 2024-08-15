def get_all_substrings(string, target_length) # string = str1, target_length = str2.size
  substrings = []
  last_index = string.size - target_length
  start_indexes = (0..last_index)

  start_indexes.each do |start_index|
    substrings << string[start_index, target_length]
  end

  substrings
end


p get_all_substrings('aaaaa', 2)

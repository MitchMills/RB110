def count_substrings(string1, string2)
  matches = 0
  start_index = 0
  target_length = string2.size
  last_index = string1.size - target_length
  indexes = (0..last_index)

  indexes.each do |index|
    next unless index == start_index
    if string1[index, target_length] == string2
      matches += 1
      start_index += target_length
    else
      start_index += 1
    end
  end
  matches
end

p count_substrings('babab', 'bab') == 1
p count_substrings('babab', 'ba') == 2
p count_substrings('babab', 'b') == 3
p count_substrings('babab', 'x') == 0
p count_substrings('', 'x') == 0
p count_substrings('bbbaabbbbaab', 'baab') == 2
p count_substrings('bbbaabbbbaab', 'bbaab') == 2
p count_substrings('bbbaabbbbaabb', 'bbbaabb') == 1

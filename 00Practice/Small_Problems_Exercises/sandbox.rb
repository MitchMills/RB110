=begin
Create a method that takes two string arguments and returns the number of times that the second string occurs in the first string. Note that overlapping strings don't count: 'babab' contains 1 instance of 'bab', not 2.

You may assume that the second argument is never an empty string.
=end

def count_substrings(string1, string2)
  matches = 0
  start_index = 0
  max_index = string1.size - string2.size

  (0..max_index).each do |current_index|
    next unless current_index == start_index
    length = string2.size

    if string1[current_index, length] == string2
      matches += 1
      start_index = current_index + length
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

def count_substrings(string1, string2)
  matches = 0
  start_index = 0
  target_length = string2.size
  max_index = string1.size - target_length
  indexes = (start_index..max_index)

  indexes.each do |current_index|
    next unless current_index == start_index

    if string1[current_index, target_length] == string2
      matches += 1
      start_index = current_index + target_length
    else
      start_index += 1
    end
  end

  matches
end

=begin
Create a method that takes two string arguments and returns the number of times that the second string occurs in the first string. Note that overlapping strings don't count: 'babab' contains 1 instance of 'bab', not 2.

You may assume that the second argument is never an empty string.
=end

def count_substrings(string1, string2)
  matches = 0
  start_index = 0
  target_length = string2.size
  candidates = string1.chars.each_cons(target_length).to_a

  candidates.each_with_index do |substring, index|
    next unless index == start_index

    if substring.join == string2
      matches += 1
      start_index = index + target_length
    else
      start_index += 1
    end
  end

  matches
end

# p count_substrings('babab', 'bab') #== 1
# p count_substrings('babab', 'ba') #== 2
# p count_substrings('babab', 'b') == 3
# p count_substrings('babab', 'x') == 0
# p count_substrings('', 'x') == 0
# p count_substrings('bbbaabbbbaab', 'baab') == 2
# p count_substrings('bbbaabbbbaab', 'bbaab') == 2
# p count_substrings('bbbaabbbbaabb', 'bbbaabb') == 1

string1 = 'babab'
string2 = 'ba'
candidates = string1.chars.each_cons(2).to_a
candidates # [["b", "a"], ["a", "b"], ["b", "a"], ["a", "b"]]

p candidates[0] # => ["b", "a"]
p string1[0, 2] # => "ba"

p candidates[1] # => ["a", "b"]
p string1[1, 2] # => "ab"

# etc

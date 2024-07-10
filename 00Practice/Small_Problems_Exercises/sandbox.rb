def count_substrings(string1, string2)
  target_length = string2.size
  substrings = get_substrings(string1, target_length)
  substrings.count(string2)
end

def get_substrings(string, target_length)
  subarrays = string.chars.each_cons(target_length).to_a
  subarrays.map(&:join)
end

p count_substrings('abcdeb', 'b') == 2
p count_substrings('cc', 'cc') == 1
p count_substrings('abbcbb', 'bb') #== 2
p count_substrings('abcdef', 'gh') == 0
p count_substrings('aaaaa', 'aa') == 4

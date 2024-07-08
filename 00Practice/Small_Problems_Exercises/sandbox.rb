=begin
ALGORITH
- Consider every possible length of substring
  - set a variable to the minimum length of substrings sought: `min_length`
  - set a variable to maximum length of substrings sought: `max_length`
  - create a range to represent possible lengths: (min_length..max_length)

- For each length, get a substring of that length from every possible start index
  - transform lengths range
    - each length becomes an array of all possible substrings of that length
      - convert input string into an array of individual characters
      - create all possible subarrays of current length
      - convert each subarray into a string
    - flatten the resulting array so it isn't nested

- Return the array of substrings
=end

# def get_all_substrings(string)
#   substrings = []
  # min_length = 2
  # max_length = string.size
  # lengths = (min_length..max_length)

#   lengths.each do |length|
#     substrings += string.chars.each_cons(length).map(&:join)
#   end
#   substrings
# end

def get_all_substrings(string)
  min_length = 2
  max_length = string.size
  lengths = (min_length..max_length)

  lengths.flat_map { |length| string.chars.each_cons(length).map(&:join) }
end

test_string = '12345'
p get_all_substrings(test_string)

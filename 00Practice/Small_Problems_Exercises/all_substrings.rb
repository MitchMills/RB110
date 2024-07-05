=begin
BASIC ALGORITHM
- create an empty array to add substrings to: `substrings`

- for each index of the input string
  - from index 0 up to (string length - 1)

  - get every possible length substring starting from that index
    - from length 1 up to (string length - current index)

    - add each substring to `substrings`

- return `substrings`
=end

### Using simple do..end loops
# def get_all_substrings(string)
#   substrings = []
#   current_index = 0
#   min_length = 1
#   last_index = string.size - min_length


#   loop do # outer loop: controls starting index of substrings
#     current_length = min_length
#     max_length = string.size - current_index

#     loop do # inner loop: controls substring lengths
#       substrings << string[current_index, current_length]

#       current_length += 1
#       break if current_length > max_length
#     end

#     current_index += 1
#     break if current_index > last_index
#   end

#   substrings
# end

# ### Using until loops
# def get_all_substrings(string)
#   substrings = []
#   current_index = 0
#   min_length = 1
#   last_index = string.size - min_length

#   until current_index > last_index # outer loop: start indexes
#     current_length = min_length
#     max_length = string.size - current_index

#     until current_length > max_length # inner loop: substring lengths
#       substrings << string[current_index, current_length]
#       current_length += 1
#     end

#     current_index += 1
#   end

#   substrings
# end

### Using ranges
def get_all_substrings(string)
  substrings = []
  min_length = 1
  last_index = string.size - min_length
  start_indexes = (0..last_index)

  start_indexes.each do |start_index| # outer loop
    max_length = string.size - start_index
    lengths = (min_length..max_length)

    lengths.each do |length| # inner loop
      substrings << string[start_index, length]
    end
  end

  substrings
end

### Using `Enumerable#each_cons`
# Here `#each_cons` handles the starting indexes (which the outer
# loop controlled in the other methods)

# Note: `sort` on the last line isn't really necessary. It just puts
# the substrings in the same order as the other methods above so the
# test case passes.

# def get_all_substrings(string)
#   substrings = []
#   min_length = 1
#   max_length = string.size
#   lengths = (min_length..max_length)

#   lengths.each do |length|
#     substrings += string.chars.each_cons(length).to_a.map(&:join)
#   end

#   substrings.sort
# end

### Using `#each_cons` and `#flat_map`
# def get_all_substrings(string)
#   min_length = 1
#   max_length = string.size
#   lengths = (min_length..max_length)

#   lengths.flat_map do |length|
#     string.chars.each_cons(length).to_a.map(&:join)
#   end.sort
# end

### Test
test_string = '12345'
expected_result = [
  "1", "12", "123", "1234", "12345",
  "2", "23", "234", "2345",
  "3", "34", "345",
  "4", "45",
  "5"
]

p get_all_substrings(test_string) #== expected_result

=begin
ALGORITHM
- Consider every possible starting index
  - create an empty array to hold substrings: `substrings`
  - set a variable to the minimum length substring: `min_length`
  - set a variable to the last index to visit: `last_index`
    - string length - minimum length
  - create a range to represent starting indexes: `start_indexes`
    - 0 up to `last_index`

- From each possible starting index, consider every possible length
  - for every start index in `start_indexes`
    - set a variable for maximum length of the substring from that index: `max_length`
      - string length - current starting index
    - create a range to represent substrings lengths: `lengths`
      - `min-length` to `max-length`

- Add a substring from current starting index, of current length, to return array
    - for every length in `lengths`
      - create current substring: string[start_index, length]
      - add current substring to `substrings` (if it meets criteria)

- return `substrings`
=end

def get_all_substrings(string)
  substrings = []
  min_length = 2
  last_index = string.size - min_length
  start_indexes = (0..last_index)

  start_indexes.each do |start_index|
    max_length = string.size - start_index
    lengths = (min_length..max_length)

    lengths.each do |length|
      substring = string[start_index, length]
      substrings << substring if true
    end
  end

  substrings
end

test_string = '12345'
p get_all_substrings(test_string)

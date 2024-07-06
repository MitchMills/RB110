################
=begin
- create an empty array to hold substrings
- set a variable to the minimum length substring required

- create a range to control starting indexes
  - from 0 up to last index
    - last index = string length - minimum length

- for every index in starting indexes range
  - find all possible substrings from that starting index

    - create a range to control substring length
      - from minimum length up to maximum length
        - maximum length = string length - current starting index

    - for every length in lengths range
      - add a substring to the substrings array
        - string[starting index, current length]

- return the substrings array
=end

# def get_all_substrings(string)
#   substrings = []
#   min_length = 1
#   last_index = string.size - min_length
#   start_indexes = (0..last_index)

#   start_indexes.each do |start_index|
#     max_length = string.size - start_index
#     lengths = (min_length..max_length)

#     lengths.each do |length|
#       substring = string[start_index, length]
#       substrings << substring if true
#     end
#   end
#   substrings
# end
###################

###################
=begin
  - create an empty array to hold substrings
  - create a range to control substring lengths
    - from minimum length up to maximum length
      - minimum length = 1 unless otherwise specified in problem
      - maximum length = string length unless otherwise specified

  - for every length in the range
    - add all possible substrings of that length to substrings array
      - convert the string to an array of individual characters
      - get all possible subarrays of current length
      - convert each subarray to a string
      - add subarrays to substrings array

  - return substrings array

=end

# def get_all_substrings(string)
#   substrings = []
#   min_length = 1
#   max_length = string.size
#   lengths = (min_length..max_length)

#   lengths.each do |length|
#     substrings += string.chars.each_cons(length).map(&:join)
#   end
#   substrings
# end
###################

###################
=begin
- create a range to control substring length
  - from minimum length up to maximum length
    - minimum length = 1 unless otherwise specified
    - maximum length = string.size unless otherwise specified

- for every length in the range
  - transform the length into an array of subarrays of that length
    - convert string into an array of individual characters
    - get all possible subarrays of current length
    - convert each subarray into a string
  - flatten the transformed array into a two-dimensional array of substrings

- return the array of substrings
=end

def get_all_substrings(string)
  lengths = (1..string.size)

  lengths.flat_map do |length|
    string.chars.each_cons(length).map(&:join)
  end
end

my_string = '12345'
p get_all_substrings(my_string)

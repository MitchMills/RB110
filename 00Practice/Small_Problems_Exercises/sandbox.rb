=begin
ALGORITHM
- create an empty array to hold substrings: `substrings`
- set a variable for minimum length: `min_length`
- set a variable for the last index to visit: `last_index`
  - (array length - `min_length`)

- for each relevant index of the input array: `start_index`
  - from index 0 up to `last_index`
    - set a variable for maximum length from that index: `max_length`
      - (array length - `start_index`)

  - get substrings of every possible length from that index: 'length'
    - from length 1 up to (array length - current `start_index`)
      - array[current `start_index`, current `length`]

    - add each substring to `substrings` array

- return `substrings` array
=end

def get_all_subarrays(array)
  subarrays = []
  min_length = 3
  last_index = (array.size - min_length)
  start_indexes = (0..last_index)

  start_indexes.each do |start_index|
    max_length = array.size - start_index
    lengths = (min_length..max_length)

    lengths.each do |length|
      subarray = array[start_index, length]
      subarrays << subarray if subarray.sum > 10
    end
  end

  subarrays
end


test_array = [1, 2, 3, 4, 5]
p get_all_subarrays(test_array)

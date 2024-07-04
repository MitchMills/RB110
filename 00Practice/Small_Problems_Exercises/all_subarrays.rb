=begin
BASIC ALGORITHM
- create an empty array to add subarrays to: `subarrays`

- for each index of the input array
  - from index 0 up to (array length - 1)

  - get every possible length subarray starting from that index
    - from length 1 up to (array length - current index)

    - add each subarray to `subarrays`

- return `subarrays`
=end

### Using simple do..end loops
def get_all_subarrays(array)
  subarrays = []
  current_index = 0
  last_index = array.size - 1

  loop do   # outer loop: controls starting index of subarrays
    current_length = 1
    max_length = array.size - current_index

    loop do   # inner loop: controls subarray lengths
      subarrays << array[current_index, current_length]

      current_length += 1
      break if current_length > max_length
    end

    current_index += 1
    break if current_index > last_index
  end

  subarrays
end

### Using until loops
def get_all_subarrays(array)
  subarrays = []
  current_index = 0
  last_index = array.size - 1

  until current_index > last_index   # outer loop: start indexes
    current_length = 1
    max_length = array.size - current_index

    until current_length > max_length   # inner loop: subarray lengths
      subarrays << array[current_index, current_length]
      current_length += 1
    end

    current_index += 1
  end

  subarrays
end

### Using ranges
def get_all_subarrays(array)
  subarrays = []
  last_index = array.size - 1
  start_indexes = (0..last_index)

  start_indexes.each do |start_index|   # outer loop
    max_length = array.size - start_index
    lengths = (1..max_length)

    lengths.each do |length|    # inner loop
      subarrays << array[start_index, length]
    end
  end

  subarrays
end

### Using ranges and a helper method
def get_all_subarrays(array)
  subarrays = []
  last_index = array.size - 1
  start_indexes = (0..last_index)

  start_indexes.each do |start_index|   # outer loop
    add_subarrays(array, subarrays, start_index)
  end

  subarrays
end

def add_subarrays(array, subarrays, start_index)
  max_length = array.size - start_index
  lengths = (1..max_length)

  lengths.each do |length|    # inner loop
    subarrays << array[start_index, length]
  end
end

### Using `Enumerable#each_cons`
# Here `#each_cons` handles the starting indexes (which the outer
# loop controlled in the other methods)

# Note: `sort` on the last line isn't really necessary. It just puts
# the subarrays in the same order as the other methods above so the
# test case passes.

def get_all_subarrays(array)
  subarrays = []
  max_length = array.size
  lengths = (1..max_length)

  lengths.each { |length| subarrays += array.each_cons(length).to_a }

  subarrays.sort
end

### Using `#each_cons` and `#flat_map`
def get_all_subarrays(array)
  lengths = (1..array.size)
  lengths.flat_map { |length| array.each_cons(length).to_a }.sort
end

### Test
test_array = [1, 2, 3, 4, 5]
expected_result = [
  [1], [1, 2], [1, 2, 3], [1, 2, 3, 4], [1, 2, 3, 4, 5],
  [2], [2, 3], [2, 3, 4], [2, 3, 4, 5],
  [3], [3, 4], [3, 4, 5],
  [4], [4, 5],
  [5]
]

p get_all_subarrays(test_array) == expected_result

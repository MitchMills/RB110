def longest_alternating_subarray(numbers)
  subarrays = get_subarrays(numbers)
  alternating = subarrays.select { |subarray| alternating?(subarray) }
  alternating.max_by(&:size) || []
end

def get_subarrays(array)
  subarrays = []
  min_length = 2
  last_index = array.size - min_length
  start_indexes = (0..last_index)

  start_indexes.each do |start_index|
    max_length = array.size - start_index
    lengths = (min_length..max_length)

    lengths.each do |length|
      subarrays << array[start_index, length]
    end
  end
  subarrays
end

def alternating?(subarray)
  pairs = subarray.each_cons(2).to_a
  pairs.all? do |pair|
    pair.first.odd? ? pair.last.even? : pair.last.odd?
  end
end

p longest_alternating_subarray([1, 2, 3, 4, 5, 6]) == [1, 2, 3, 4, 5, 6]
p longest_alternating_subarray([2, 4, 6, 8]) == []
p longest_alternating_subarray([1, 3, 5, 7]) == []
p longest_alternating_subarray([1, 1, 3, 7, 8, 5]) == [7, 8, 5]
p longest_alternating_subarray([4, 6, 7, 12, 11, 9, 17]) == [6, 7, 12, 11]

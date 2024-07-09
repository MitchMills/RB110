def shortest_length(numbers, target)
  subarrays = get_subarrays(numbers)
  candidates = subarrays.select { |subarray| subarray.sum >= target }
  shortest = candidates.min_by(&:size) || []
  shortest.size
end

def get_subarrays(array)
  subarrays = []
  min_length = 1
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

p shortest_length([2, 3, 1, 2, 4, 3], 7) == 2 # [4, 2]
p shortest_length([1, 10, 5, 2, 7], 9) == 1 # [10]
p shortest_length([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
p shortest_length([1, 2, 4, 1], 8) == 4 # [1, 2, 4, 1]
p shortest_length([1, 2, 4], 8) == 0
p shortest_length([], 1) == 0

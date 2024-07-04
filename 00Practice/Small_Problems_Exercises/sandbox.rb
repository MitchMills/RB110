def longest_alternating_subarray(array)
  alternating_subarrays = get_alternating_subarrays(array)
  alternating_subarrays.max_by(&:size) || []
end

def get_alternating_subarrays(array)
  alternating_subarrays = []
  last_index = array.size - 2

  (0..last_index).each do |start_index|
    max_length = array.size - start_index

    (2..max_length).each do |length|
      subarray = array[start_index, length]
      alternating_subarrays << subarray if alternating?(subarray)
    end
  end

  alternating_subarrays
end

def alternating?(array)
  last_index = array.size - 2

  (0..last_index).all? do |current_index|
    number = array[current_index]
    next_number = array[current_index + 1]

    if number.odd?
      next_number.even?
    elsif number.even?
      next_number.odd?
    end
  end
end

p longest_alternating_subarray([1, 2, 3, 4, 5, 6]) == [1, 2, 3, 4, 5, 6]
p longest_alternating_subarray([2, 4, 6, 8]) == []
p longest_alternating_subarray([1, 3, 5, 7]) == []
p longest_alternating_subarray([1, 1, 3, 7, 8, 5]) == [7, 8, 5]
p longest_alternating_subarray([4, 6, 7, 12, 11, 9, 17]) == [6, 7, 12, 11]

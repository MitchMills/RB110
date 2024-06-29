def minimum_sum(numbers)
  subarrays = get_subarrays(numbers)
  sums = subarrays.map(&:sum)
  sums.min
end

def get_subarrays(array)
  last_index = array.size - 5
  (0..last_index).map do |start_index|
    array[start_index, 5]
  end
end

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, -5]) == 9
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

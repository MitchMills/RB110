def find_fibonacci_slices(array)
  fib_slices = []
  last_index = array.size - 3

  (0..last_index).each do |start_index|
    get_fib_slices(array, start_index, fib_slices)
  end

  fib_slices
end

def get_fib_slices(source_array, start_index, results_array)
  max_size = source_array.size - start_index

  (3..max_size).each do |length|
    current_subarray = source_array[start_index, length]
    results_array << current_subarray if fibonacci_slice?(current_subarray)
  end
end

def fibonacci_slice?(array)
  final_index = array.size - 3

  (0..final_index).all? do |index|
    current_three_elements = array[index, 3]
    current_three_elements.take(2).sum == current_three_elements.last
  end
end

p find_fibonacci_slices([1, 1, 2, 3, 5, 8]) == [[1, 1, 2], [1, 1, 2, 3], [1, 1, 2, 3, 5], [1, 1, 2, 3, 5, 8], [1, 2, 3], [1, 2, 3, 5], [1, 2, 3, 5, 8], [2, 3, 5], [2, 3, 5, 8], [3, 5, 8]]
p find_fibonacci_slices([2, 4, 7, 11, 18]) == [[4, 7, 11], [4, 7, 11, 18], [7, 11, 18]]
p find_fibonacci_slices([5, 5, 10, 15, 24, 40]) == [[5, 5, 10], [5, 5, 10, 15], [5, 10, 15]]
p find_fibonacci_slices([1, 2, 4, 6, 10, 16]) == [[2, 4, 6], [2, 4, 6, 10], [2, 4, 6, 10, 16], [4, 6, 10], [4, 6, 10, 16], [6, 10, 16]]
p find_fibonacci_slices([10, 22, 33, 43, 56]) == []

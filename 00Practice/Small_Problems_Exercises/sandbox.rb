def find_fibonacci_slices(array)
  fib_slices = []
  last_index = array.size - 3
  start_indexes = (0..last_index)

  start_indexes.each do |start_index|
    get_fib_slices(array, start_index, fib_slices)
  end

  fib_slices
end

def get_fib_slices(source_array, start_index, results_array)
  max_length = source_array.size - start_index
  lengths = (3..max_length)

  lengths.each do |length|
    current_subarray = source_array[start_index, length]
    results_array << current_subarray if fibonacci_slice?(current_subarray)
  end
end

def fibonacci_slice?(array)
  array.each_cons(3).all? do |three_elements|
    three_elements.take(2).sum == three_elements.last
  end
end

def get_all_subarrays(array)
  lengths = (1..array.size)
  lengths.flat_map { |length| array.each_cons(length).to_a }
end

test_array = (1..5).to_a
p get_all_subarrays(test_array) == [[1], [2], [3], [4], [5], [1, 2], [2, 3], [3, 4], [4, 5], [1, 2, 3], [2, 3, 4], [3, 4, 5], [1, 2, 3, 4], [2, 3, 4, 5], [1, 2, 3, 4, 5]]

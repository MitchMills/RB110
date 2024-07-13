def closest_numbers(numbers)
  pairs = get_pairs(numbers)
  minimum_difference = pairs.map { |pair| pair.inject(:-).abs }.min
  pairs.find { |pair| pair.inject(:-).abs == minimum_difference }
end

def get_pairs(array)
  pairs = []
  last_index = array.size - 1
  array.each_index do |index1|
    ((index1 + 1)..last_index).each do |index2|
      pairs << [array[index1], array[index2]]
    end
  end
  pairs
end

p closest_numbers([2, 4, 6, 7]) == [6, 7]
p closest_numbers([5, 15, 25, 11, 20]) == [15, 11]
p closest_numbers([3, 6, 8, 11, 13]) == [6, 8]
p closest_numbers([12, 7, 17]) == [12, 7]

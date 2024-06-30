def closest_numbers(array)
  pairs = get_pairs(array)
  pairs.min_by { |pair| pair.inject(:-).abs }
end

def get_pairs(array)
  pairs = []
  last_index = array.size - 1

  (0..last_index).each do |index1|
    ((index1 + 1)..last_index).each do |index2|
      pairs << get_one_pair(array, index1, index2)
    end
  end

  pairs
end

def get_one_pair(array, index1, index2)
  [array[index1], array[index2]]
end

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 22, 7, 17]) == [12, 7]

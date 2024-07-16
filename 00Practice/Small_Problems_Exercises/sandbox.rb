def closest_numbers(numbers)
  pairs = get_pairs(numbers)
  # differences = pairs.map { |pair| pair.inject(:-).abs }
  # min_difference = differences.min
  # pairs.find { |pair| pair.inject(:-).abs == min_difference }
end

def get_pairs(numbers)
  pairs = []
  first_indexes = (0..(numbers.size - 2))

  first_indexes.each do |index1|
    second_indexes = ((index1 + 1)..(numbers.size - 1))

    second_indexes.each do |index2|
      pairs << [numbers[index1], numbers[index2]]
    end
  end
  pairs
end

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 22, 7, 17]) == [12, 7]

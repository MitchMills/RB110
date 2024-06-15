def closest_numbers(numbers)
  pairs = get_pairs(numbers)
  pairs.min_by { |pair| pair.inject(:-).abs }
end

def get_pairs(numbers)
  pairs = []
  last_start_index = numbers.size - 2
  last_index = numbers.size - 1

  (0..last_start_index).each do |index1|
    next_index = index1 + 1
    (next_index..last_index).each do |index2|
      pairs << [numbers[index1], numbers[index2]]
    end
  end

  pairs
end

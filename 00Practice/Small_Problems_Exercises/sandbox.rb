def pairs(array)
  pairs = []
  number_of_pairs = (array.size / 2.0).ceil

  number_of_pairs.times do |pair_index|
    pairs << [array[pair_index], array[-(pair_index + 1)]]
  end
  pairs
end

def pairs1(array)
  number_of_pairs = (array.size / 2.0).ceil

  number_of_pairs.times.map do |pair_index|
    [array[pair_index], array[-(pair_index + 1)]]
  end
end

p pairs([1, 2, 3, 4, 5, 6]) == [[1, 6], [2, 5], [3, 4]]
p pairs([1, 2, 3, 4, 5]) == [[1, 5], [2, 4], [3, 3]]
p pairs([1, 2]) == [[1, 2]]
p pairs([1]) == [[1, 1]]
p pairs([]) == []

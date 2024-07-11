def pairs(array)
  pairs = []
  length = array.size
  reps = (length + 1) / 2
  reps.times { |rep| pairs << [array[rep], array[length - (rep + 1)]] }
  pairs
end

def pairs1(array)
  length = array.size
  reps = (length + 1) / 2
  reps.times.map { |rep| [array[rep], array[length - (rep + 1)]] }
end

p pairs([1, 2, 3, 4, 5, 6]) == [[1, 6], [2, 5], [3, 4]]
p pairs([1, 2, 3, 4, 5]) == [[1, 5], [2, 4], [3, 3]]
p pairs([1, 2]) == [[1, 2]]
p pairs([1]) == [[1, 1]]
p pairs([]) == []

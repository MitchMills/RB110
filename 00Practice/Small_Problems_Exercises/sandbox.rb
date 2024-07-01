def pairs1(numbers)
  uniques = numbers.uniq
  counts = uniques.map { |number| numbers.count(number) }
  pair_count = counts.map { |count| count / 2 }
  pair_count.sum
end

def pairs(numbers)
  numbers.uniq.map { |number| numbers.count(number) / 2 }.sum
end

p pairs([3, 1, 4, 5, 9, 2, 6, 5, 3, 5, 8, 9, 7]) == 3
p pairs([2, 7, 1, 8, 2, 8, 1, 8, 2, 8, 4]) == 4
p pairs([]) == 0
p pairs([23]) == 0
p pairs([997, 997]) == 1
p pairs([32, 32, 32]) == 1
p pairs([7, 7, 7, 7, 7, 7, 7]) == 3

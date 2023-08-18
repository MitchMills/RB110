# array = [
#   ['a', 'cat', 'b', 'c'],
#   ['b', 2],
#   ['a', 'car', 'd', 3],
#   ['a', 'car', 'd']
# ]

# p array.sort # --> [
#   ["a", "car", "d"],
#   ["a", "car", "d", 3],
#   ["a", "cat", "b", "c"],
#   ["b", 2]
# ]

# array = [5, 3, 2, 4, 1]
# sorted = array.sort

# p array, sorted

# p "#{array[4]}: #{array[4].object_id}"
# p "#{sorted[0]}: #{sorted[0].object_id}"
 
array = ['cot', 'bed', 'mat']
sorted = array.sort_by do |word|
  word[1]
end
p array
p sorted

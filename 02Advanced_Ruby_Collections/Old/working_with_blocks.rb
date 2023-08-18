# MUTATING COLLECTIONS WHILE ITERATING
# def remove_evens!(arr)
#   cloned_arr = arr.dup
#   cloned_arr.each do |num|
#     if num % 2 == 0
#       arr.delete(num)
#     end
#   end
#   arr
# end

# p array1 = [1, 1, 2, 3, 4, 6, 8, 9]
# array2 = remove_evens!(array1)
# p array1
# p array2


# EXAMPLE 10
# array1 = [
#   [[1, 2], [3, 4]],
#   [5, 6]
# ]

# array2 = 
# array1.map do |arr|
#   arr.map do |el|
#     if el.to_s.size == 1  # it's an integer
#       el + 1
#     else                  # it's an array
#       el.map do |n|
#         n + 1
#       end
#     end
#   end
# end

# p array1
# p array2



# EXAMPLE 9
# array1 = [
#   [[1], [2], [3], [4]],
#   [['a'], ['b'], ['c']]
# ]

# array2 =
# array1.map do |element1|
#   element1.each do |element2|
#     element2.partition do |element3|
#       element3.size > 0
#     end
#   end
# end

# p array1
# p array2


# EXAMPLE 8
# array1 = [[8, 13, 27], ['apple', 'banana', 'cantaloupe']]

# array2 = []
# array1.each do |arr|
#   selected =  arr.select do |item|
#                 if item.to_s.to_i == item
#                   item > 13
#                 else
#                   item.size < 6
#                 end
#               end
#   array2 << selected
# end

# array2 =
# array1.map do |arr|
#   arr.select do |item|
#     if item.to_s.to_i == item # i.e. is it an integer?
#       item > 13
#     else
#       item.size < 6
#     end
#   end
# end

# p array1
# p array2


# EXAMPLE 7
# arr = [
#   ['1',  '8', '11'], 
#   ['2',  '6', '13'], 
#   ['2', '12', '15'], 
#   ['1',  '8',  '9']
# ]

# string_sort = arr.sort

# p string_sort # --> [["1", "8", "11"], ["1", "8", "9"], ["2", "12", "15"], ["2", "6", "13"]]

# num_sort =  arr.sort_by do |sub_arr|
#               sub_arr.map do |num|
#                 num.to_i
#               end
#             end

# p num_sort # --> [["1", "8", "9"], ["1", "8", "11"], ["2", "6", "13"], ["2", "12", "15"]]
# p arr


# EXAMPLE 6
# array1 = [{ a: 'ant', b: 'elephant' }, { c: 'cat' }]

# array2 = 
# array1.select do |hash|
#   hash.any? do |key, value|
#     value[0] == key.to_s
#   end
# end

# p array1
# p array2
# puts
# p array1[0].object_id
# p array2[0].object_id


# EXAMPLE 5
# array1 = [[1, 2], [3, 4]]

# array2 = 
# array1.map do |arr|
#   arr.map do |num|
#     num * 2
#   end
# end

# p array1
# p array2


# EXAMPLE 4
# array1 = [[18, 7], [3, 12]]
# p array1
# puts

# my_array = 
# array1.each do |arr|
#   arr.each do |num|
#     if num > 5
#       puts num
#     end
#   end
# end
# puts

# p array1
# p my_array
# p array1.object_id
# p my_array.object_id


# EXAMPLE 3
# array1 = [[1, 2], [3, 4]]

# array2 = array1.map do |arr|
#   puts arr.first
#   arr.first
# end

# p array1
# p array2


# EXAMPLE 2
# array1 = [[1, 2], [3, 4]]

# array2 = array1.map do |arr|
#   puts arr.first
# end

# p array1
# p array2


# EXAMPLE 1
# [[1, 2], [3, 4]].each do |arr|
#   puts arr.first
# end

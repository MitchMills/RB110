# SHALLOW COPIES
array = ['the', 'quick', 'brown', 'fox']
array.freeze

p array
array[0] << 'e'
p array

# array1 = ['a', 'b', 'c']
# puts "array1 before: #{array1}"

# array2 = array1.map do |char|
#   char.upcase
# end
# puts "array1 after: #{array1}"
# puts "array2: #{array2}"

# puts

# array3 = ['d', 'e', 'f']
# puts "array3 before: #{array3}"

# array4 = array3.each do |char|
#   char.upcase!
# end

# puts "array3 after: #{array3}"
# puts "array4: #{array4}"


# array1 = ['a', 'b', 'c']
# array2 = array1.dup

# puts "array1: #{array1.object_id}"
# puts "array2: #{array2.object_id}"

# puts "array1[1]: #{array1[1].object_id}"
# puts "array2[1]: #{array2[1].object_id}"

# array3 = array2.map! do |char|
#   char.upcase
# end

# p array1
# p array2
# p array3

# puts "array1: #{array1.object_id}"
# puts "array2: #{array2.object_id}"
# puts "array3: #{array3.object_id}"

# puts "array1[1]: #{array1[1].object_id}"
# puts "array2[1]: #{array2[1].object_id}"
# puts "array3[1]: #{array3[1].object_id}"

# array = [[1, 2], [3, 4]]
# array2 = array
# arraydup = array.dup
# arrayclone = array.clone

# puts "array: #{array.object_id}"
# puts "array2: #{array2.object_id}"
# puts "arraydup: #{arraydup.object_id}"
# puts "arrayclone: #{arrayclone.object_id}"

# puts "array[1][0]: #{array[1][0].object_id}"
# puts "array2[1][0]: #{array2[1][0].object_id}"
# puts "arraydup[1][0]: #{arraydup[1][0].object_id}"
# puts "arrayclone[1][0]: #{arrayclone[1][0].object_id}"

# string = 'hello world'
# string2 = string
# stringdup = string.dup
# stringclone = string.clone

# puts "string: #{string.object_id}"
# puts "string2: #{string2.object_id}"
# puts "stringdup: #{stringdup.object_id}"
# puts "stringclone: #{stringclone.object_id}"


# REFERENCING, UPDATING, APPENDING
# a = [1, 3]
# b = [2]
# array1 = [a, b]

# p array1
# p array1.object_id
# puts

# p array1[0]
# p array1[0].object_id
# puts

# p a[1].object_id
# a[1] = 5
# p a[1].object_id
# puts

# p array1
# p array1.object_id
# puts

# p array1[0]
# p array1[0].object_id


# array = [[1, 3], [2]]

# p array[0]
# p array[0].object_id
# puts

# p array[0][1]
# p array[0][1].object_id
# puts

# array[0][1] = 2
# puts

# p array[0]
# p array[0].object_id
# puts

# p array[0][1]
# p array[0][1].object_id

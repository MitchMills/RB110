array1 = ['a', 'b', 'c']
array2 = array1.dup

p array1.object_id
p array2.object_id
puts

array1.reverse!
p array1
p array2

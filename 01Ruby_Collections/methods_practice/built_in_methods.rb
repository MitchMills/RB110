long, short = { a: 'ant', b: 'bear', c: 'cat' }.partition do |key, value|
  value.size > 3
end
p long
p short

# ARRAYS
# array = [1, 2, 3, 4, 5]
# p "Original array: #{array}"

# array_each_return_value = 
# array.each do |num|
#   puts num
# end
# p "Array.each returns: #{array_each_return_value}"


# array_select_return_value = 
# array.select do |num|
#   num.odd? # --> [1, 3, 5]
#   # num + 1 #--> [1, 2, 3, 4, 5]
#   # puts num #--> [] (nil is falsey, so element is not selected)
# end
# p "Array.select returns: #{array_select_return_value}"


# array_map_return_value =
# array.map do |num|
#   # num + 3 # --> [4, 5, 6, 7, 8]
#   # num.odd? # --> [true, false, true, false, true]
#   # puts num # --> [nil, nil, nil, nil, nil]
#   'Hello' # --> ['Hello', 'Hello', 'Hello', 'Hello', 'Hello']
# end
# p "Array.map returns: #{array_map_return_value}"


# HASHES
# hash = { a: 1, b: 2, c: 3 }
# p "Original hash: #{hash}"

# hash_each_return_value = 
# hash.each do |key, value|
#   puts "The key is #{key} and the value is #{value}."
# end
# p "Hash.each returns: #{hash_each_return_value}"


# hash_select_return_value = 
# hash.select do |key, value|
#   value > 1 # --> { b: 2, c: 3 }
# end
# p "Hash.select returns: #{hash_select_return_value}"


# hash_map_return_value =
# hash.map do |key, value|
#   # value * 2 # --> [2, 4, 6]
#   # key = 42 # --> [42, 42, 42]
#   puts key # --> [nil, nil, nil]
# end
# p "Hash.map returns: #{hash_map_return_value}"

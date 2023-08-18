# ARRAYS
array = [1, 2, 3, 4, 5]

# array_any = array.any? do |num|
#               num > 2
#             end
# p array_any # --> true
# p array

# array_all = array.all? do |num|
#               num > 2
#             end
# p array_all # --> false
# p array

# array_ewi = array.each_with_index do |num, index|
#               puts "The index of #{num} is #{index}."
#             end
# p array_ewi
# p array

# array_ewo = array.each_with_object([]) do |num, array|
#               array << num if num.odd?
#             end
# p array_ewo # --> [1, 3, 5]
# p array

# array_partition = array.partition do |num|
#                     num.odd?
#                   end
# p array_partition # --> [[1, 3, 5], [2, 4]]
# p array

# odd, even = array.partition do |num|
#   num.odd?
# end
# p odd # --> [1, 3, 5]
# p even # --> [2, 4]
# p array


# HASHES
hash = { a: 'ant', b: 'bear', c: 'cat' }

# hash_any =  hash.any? do |key, value|
#               value.size > 4
#             end
# p hash_any # --> false
# p hash

# hash_all =  hash.all? do |key, value|
#               value.length >= 3
#             end
# p hash_all # --> true
# p hash

# hash_ewi =  hash.each_with_index do |kv_pair, index|
#               puts "The index of #{kv_pair} is #{index}."
#             end
# p hash_ewi
# p hash

# hash_ewo =  hash.each_with_object([]) do |kv_pair, array|
#               array << kv_pair.last
#             end
# p hash_ewo # --> ['ant', 'bear', 'cat']
# p hash

# hash_ewo2 = hash.each_with_object({}) do |(key, value), hash|
#   hash[value] = key
# end
# p hash_ewo2 # --> { "ant" => :a, "bear" => :b, "cat" => :c }
# p hash

long, short = hash.partition do |key, value|
                value.size > 3
              end
p long
p short
p hash
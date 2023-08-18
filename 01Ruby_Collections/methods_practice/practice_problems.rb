# Practice Problems: Methods and More Methods

# Problem 10
nums = [1, 2, 3]
mapped_nums = nums.map do |num|
                if num > 1
                  puts num
                else
                  num
                end
              end
p mapped_nums # --> [1, nil, nil]
p nums # --> [1, 2, 3]

# Problem 9
# hash = { a: 'ant', b: 'bear' }
# mapped_hash = hash.map do |key, value|
#                 if value.size > 3
#                   value
#                 end
#               end
# p mapped_hash # --> [nil, 'bear']
# p hash # --> { a: 'ant', b: 'bear }

# Problem 8
# array = [1, 2, 3, 4, 5]
# taken = array.take(2)
# p taken # --> [1, 2]
# p array # --> [1, 2, 3, 4, 5]

# Problem 7
# nums = [1, 2, 3]
# nums_any =  nums.any? do |num|
#               puts num
#               num.odd? # --> [true, false, true]
#             end # --> 1 (iteration stops on first true returned)
# p nums_any # --> true
# p nums

# Problem 6
# animals = ['ant', 'bear', 'caterpillar']
# p animals.pop.size # --> 11
# p animals

# Problem 5
# hash = { a: 'ant', b: 'bear' }
# shifted = hash.shift
# p shifted # --> [:a, 'ant]
# p hash # --> { b: 'bear' }

# Problem 4
# animals = ['ant', 'bear', 'cat']
# animal_hash = animals.each_with_object({}) do |value, hash|
#                 hash[value[0]] = value
#               end
# p animal_hash # --> { 'a' => 'ant', 'b' => 'bear', 'c' => 'cat' }
# p animals              

# Problem 3
# numbers = [1, 2, 3]
# rejected_nums = numbers.reject do |num|
#                   puts num
#                 end
# p rejected_nums # --> [1, 2, 3]
# p numbers                

# Problem 2
# animals = ['ant', 'bat', 'caterpillar']
# short = animals.count do |str|
#           str.length < 4
#         end
# p short # --> 2
# p animals

# Problem 1
# array = [1, 2, 3]
# array.select do |num|
#   num > 5
#   'hi'
# end
# p array # --> [1, 2, 3]
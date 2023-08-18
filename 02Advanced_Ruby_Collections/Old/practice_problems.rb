# PROBLEM 16
# def create_uuid()
#   pattern = [8, 4, 4, 4, 12]
#   hex_chars = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)
#   uuid = ''
#   pattern.each_with_index do |num, index|
#     num.times { uuid << hex_chars.sample }
#     uuid << '-' unless index >= (pattern.size - 1)
#   end
#   uuid
# end

# uuid = create_uuid()
# p uuid



# PROBLEM 15
# array1 = [
#   {a: [1, 2, 3]}, 
#   {b: [2, 4, 6], c: [3, 6], d: [4]}, 
#   {e: [8], f: [6, 10]}
# ]

# array2 = 
# array1.select do |hash|
#   hash.all? do |_, value|
#     value.all? do |num|
#       num.even?
#     end
#   end
# end

# p array1
# p array2


# PROBLEM 14
# hsh = {
#   'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
#   'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
#   'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
#   'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
#   'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
# }

# erv = [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

# array =
# hsh.map do |_, info|
#   if info[:type] == 'fruit'
#     info[:colors].map {|color| color.capitalize}
#   elsif info[:type] == 'vegetable'
#     info[:size].upcase
#   end
# end

# p array
# p erv


# PROBLEM 13
# array1 = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]
# erv = [[1, 8, 3], [1, 5, 9], [6, 1, 7], [1, 6, 9]]

# sorted_array = array1.sort_by do |array| 
#   array.select {|num| num.odd?}
# end

# p array1
# p sorted_array
# p erv


# PROBLEM 12
# array1 = [
#   [:a, 1], 
#   ['b', 'two'], 
#   ['sea', {c: 3}], 
#   [{a: 1, b: 2, c: 3, d: 4}, 'D']
# ]

# hash1 = array1.each_with_object({}) do |array, hash|
#   hash[array[0]] = array[1]
# end

# # hash1 = {}
# # array1.each do |element|
# #   hash1[element[0]] = element[1]
# # end


# p array1
# p hash1

# # expected return value: 
# erv = {
#   :a=>1, 
#   "b"=>"two", 
#   "sea"=>{:c=>3}, 
#   {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"
# }


# PROBLEM 11
# array1 = [
#   [2], 
#   [3, 5, 7], 
#   [9], 
#   [11, 13, 15]
# ]

# array2 = array1.map do |arr|
#   arr.select do |num|
#     num % 3 == 0
#   end
# end

# p array1
# p array2


# PROBLEM 10
# array1 = [
#   {a: 1},
#   {b: 2, c: 3},
#   {d: 4, e: 5, f: 6}
# ]

# # array2 = array1.map do |hash|
# #   hash.transform_values {|value| value += 1}
# # end

# # array2 = array1.map do |hash|
# #   incremented_hash = {}
# #   hash.each do |key, value|
# #     incremented_hash[key] = value + 1
# #   end
# #   incremented_hash
# # end

# array2 = array1.each_with_object([]) do |hash, array|
#     incremented_hash = {}
#     hash.each {|key, value| incremented_hash[key] = value + 1}
#     array << incremented_hash
# end

# p array1
# p array2


# PROBLEM 9
# arr = [
#   ['b', 'c', 'a'], 
#   [2, 1, 3], 
#   ['blue', 'black', 'green']
# ]

# sorted_array =
# arr.map do |sub_array|
#   sub_array.sort {|a, b| b <=> a}
# end

# p sorted_array


# PROBLEM 8
# hsh = {
#   first: ['the', 'quick'], 
#   second: ['brown', 'fox'], 
#   third: ['jumped'], 
#   fourth: ['over', 'the', 'lazy', 'dog']
# }
# vowels = 'aeiouy'
# hsh.values.each do |words|
#   words.each do |word|
#     word.chars.each do |char|
#       puts char if vowels.include?(char)
#     end
#   end
# end


# PROBLEM 7
# a = 2
# b = [5, 8]
# arr = [a, b]

# p a # --> 2
# p b # --> [5, 8]
# p arr # --> [2, [5, 8]]
# puts

# arr[0] += 2
# arr[1][0] -= a

# p a # --> 2
# p b # --> [3, 8]
# p arr # --> [4, [3, 8]]


# PROBLEM 6
# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# munsters.each do |name, info|
#   puts "#{name} is a #{info["age"]}-year-old #{info["gender"]}."
# end


# PROBLEM 5
# munsters = {
#   "Herman" =>   { "age" => 32, "gender" => "male" },
#   "Lily" =>     { "age" => 30, "gender" => "female" },
#   "Grandpa" =>  { "age" => 402, "gender" => "male" },
#   "Eddie" =>    { "age" => 10, "gender" => "male" },
#   "Marilyn" =>  { "age" => 23, "gender" => "female"}
# }

# total_male_age = 0
# munsters.each_value do |info|
#   total_male_age += info['age'] if info['gender'] == 'male'
# end

# p total_male_age



# PROBLEM 4
# arr1 = [1, [2, 3], 4]
# p arr1
# arr1[1][1] = 4
# p arr1
# puts


# arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
# p arr2
# arr2[2] = 4
# p arr2
# puts


# hsh1 = { first: [1, 2, [3]] }
# p hsh1
# hsh1[:first][2][0] = 4
# p hsh1
# puts


# hsh2 = { ['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5 }
# p hsh2
# hsh2[['a']][:a][2] = 4
# p hsh2


# PROBLEM 3
# arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
# arr1_g = arr1[2][1][3]
# p arr1_g


# arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
# arr2_g = arr2[1][:third][0]
# p arr2_g


# arr3 = [['abc'], ['def'], {third: ['ghi']}]
# arr3_g = arr3[2][:third][0][0]
# p arr3_g


# hsh1 = { 'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i'] }
# hsh1_g = hsh1['b'][1]
# p hsh1_g


# hsh2 = { first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0} }
# hsh2_g = hsh2[:third].key(0)
# p hsh2_g


# PROBLEM 2
# books = [
#   {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
#   {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
#   {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
#   {title: 'Ulysses', author: 'James Joyce', published: '1922'}
# ]

# sorted_by_pub_year =
# books.sort_by do |book|
#   book[:published]
# end

# puts sorted_by_pub_year


# PROBLEM 1
# arr = ['10', '11', '9', '7', '8']

# sorted = arr.sort_by {|string| string.to_i}.reverse

# sorted2 = arr.sort do |a, b|
#   b.to_i <=> a.to_i
# end

# p sorted
# p sorted2

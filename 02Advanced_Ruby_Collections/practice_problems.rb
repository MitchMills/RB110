##### 11111111




##### 10101010
# def increment(array)
#   array.map do |hash|
#     hash.each_with_object({}) { |(key, value), result| result[key] = value + 1 }
#   end
# end

# array1 = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
# array2 = [{a: 2}, {b: 3, c: 4}, {d: 5, e: 6, f: 7}]

# p increment(array1) == array2
# p array1 == [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
# p array2 == [{a: 2}, {b: 3, c: 4}, {d: 5, e: 6, f: 7}]

##### 9999
# def multi_sort(array)
#   array.map { |subarray| subarray.sort.reverse }
# end

# def multi_sort(array)
#   array.map { |subarray| subarray.sort { |a, b| b <=> a } }
# end

# arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

# p multi_sort(arr)

##### 8888
# def display_all_vowels(hash)
#   vowels = 'aeiou'
#   hash.each_value do |words|
#     words.each do |word|
#       word.each_char do |char|
#         puts char if vowels.include?(char)
#       end
#     end
#   end
# end

# hsh = {
#   first: ['the', 'quick'], 
#   second: ['brown', 'fox'], 
#   third: ['jumped'], 
#   fourth: ['over', 'the', 'lazy', 'dog']
# }

# display_all_vowels(hsh)

##### 7777
# a = 2
# b = [5, 8]
# arr = [a, b] # [2, [5, 8]]

# arr[0] += 2 # [4, [5, 8]]
# arr[1][0] -= a # [4, [3, 8]]

# p a # 2
# p b # [3, 8]
# p arr # [4, [3, 8]]


##### 6666
# def display_family_member_info(family)
#   family.each do |name, info|
#     puts "#{name} is a #{info['age']}-year-old #{info['gender']}."
#   end
# end

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# display_family_member_info(munsters)

##### 5555
# def male_ages(family)
#   age = 0
#   family.each_value { |info| age += info["age"] if info["gender"] == "male" }
#   age
# end

# def male_ages(family)
#   males = family.values.select { |info| info["gender"] == "male" }
#   males.map { |stats| stats["age"] }.sum
# end

# def male_ages(family)
#   family.values.inject(0) do |total_age, info|
#     info['gender'] == 'male' ? total_age += info['age'] : total_age
#   end
# end

# def male_ages(family)
#   family.values.map { |info| info['gender'] == 'male' ? info['age'] : 0 }.sum
# end

# def male_ages(family)
#   family.values.filter_map do |info|
#     info['age'] if info['gender'] == 'male'
#   end.sum
# end

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# p male_ages(munsters)

##### 4444
# arr1 = [1, [2, 3], 4]
# p arr1
# arr1[1][1] += 1
# p arr1

# arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
# p arr2
# arr2[2] += 1
# p arr2

# hsh1 = {first: [1, 2, [3]]}
# p hsh1
# hsh1[:first][2][0] += 1
# p hsh1

# hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
# p hsh2
# hsh2[['a']][:a][2] += 1
# p hsh2

##### 3333
# arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
# p arr1[2][1][3]

# arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
# p arr2[1][:third][0]

# arr3 = [['abc'], ['def'], {third: ['ghi']}]
# p arr3[2][:third][0][0]

# hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
# p hsh1['b'][1]

# hsh2 = {
#   first: {'d' => 3}, 
#   second: {'e' => 2, 'f' => 1}, 
#   third: {'g' => 0}
# }
# p hsh2[:third].keys[0]

##### 2222
# def sort_by_year(array)
#   array.sort_by { |book_info| book_info[:published].to_i }
# end

# books = [
#   {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
#   {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
#   {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
#   {title: 'Ulysses', author: 'James Joyce', published: '1922'}
# ]

# sorted = sort_by_year(books)
# p books
# p sorted

#### 11111
# def reverse_numeric_sort(array)
#   array.sort { |a, b| b.to_i <=> a.to_i }
# end

# arr = ['10', '11', '9', '7', '8']

# sorted = reverse_numeric_sort(arr)

# p arr
# p sorted

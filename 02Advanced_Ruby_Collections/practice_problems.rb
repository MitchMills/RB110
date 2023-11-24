##### 1616161616
PATTERN = [8, 4, 4, 4, 12]
HEXADECIMALS = ('0'..'9').to_a + ('a'..'f').to_a

# def generate_uuid
#   PATTERN.map do |digits|
#     substring = ''
#     digits.times do |digit|
#       substring << HEXADECIMALS.sample
#     end
#     substring
#   end.join('-')
# end

def generate_uuid
  PATTERN.map do |digits|
    (1..digits).map { |digit| HEXADECIMALS.sample }.join
  end.join('-')
end

p generate_uuid

##### 1515151515
# def all_even(lists)
#   lists.select do |hash|
#     hash.each_value.all? do |numbers|
#       numbers.all? { |number| number.even? }
#     end
#   end
# end

# arr = [
#   {a: [1, 2, 3]}, 
#   {b: [2, 4, 6], c: [3, 6], d: [4]}, 
#   {e: [8], f: [6, 10]}
# ]
# p all_even(arr) == [{e: [8], f: [6, 10]}]

##### 1414141414
# def colors_and_sizes(list)
#   list.each_value.map do |data|
#     data[:type] == 'fruit' ? data[:colors].map(&:capitalize) : data[:size].upcase
#   end
# end

# products = {
#   'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
#   'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
#   'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
#   'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
#   'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
# }

# p colors_and_sizes(products) == [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

##### 1313131313
# def odd_sort(array)
#   array.sort_by do |subarray|
#     subarray.select { |num| num.odd? }
#   end
# end

# lists = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]
# p odd_sort(lists) == [[1, 8, 3], [1, 5, 9], [6, 1, 7], [1, 6, 9]]
# p lists

##### 1212121212
# def hashify(array)
#   array.each_with_object({}) do |subarray, hash|
#     key, value = subarray
#     hash[key] = value
#   end
# end

# pairs = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# p hashify(pairs) == {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}


##### 1111111111
# def multiples(lists, multiple)
#   lists.map { |list| get_multiples(list, multiple) }
# end

# def get_multiples(list, multiple)
#   list.select { |number| multiple_of?(number, multiple) }
# end

# def multiple_of?(number, multiple)
#   number % multiple == 0
# end

# number_lists = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]

# p multiples(number_lists, 3) == [[], [3, 12], [9], [15]]


##### 1010101010
# def add_one(array)
#   array.map do |hash|
#     hash.each_with_object({}) do |(key, value), new_hash|
#       new_hash[key] = value + 1
#     end
#   end
# end

# original = [
#   {a: 1}, 
#   {b: 2, c: 3}, 
#   {d: 4, e: 5, f: 6}
# ]

# p add_one(original) #== [{a: 2}, {b: 3, c: 4}, {d: 5, e: 6, f: 7}]
# p original

##### 99999
# def sort_nested_array(array)
#   array.map do |subarray|
#     subarray.sort.reverse
#   end
# end

# arr = [
#   ['b', 'c', 'a'], 
#   [2, 1, 3], 
#   ['blue', 'black', 'green']
# ]

# p sort_nested_array(arr)

##### 88888
# def vowels(lists)
#   vowels = get_all_vowels(lists)
#   display_vowels(vowels)
# end

# def get_all_vowels(lists)
#   lists.each_value.map do |list|
#     list.map { |word| get_each_vowel(word) }
#   end.flatten
# end

# def get_each_vowel(word)
#   word.each_char.select { |char| vowel?(char) }
# end

# def vowel?(char)
#   'AEIOUaeiou'.include?(char)
# end

# def display_vowels(vowels_list)
#   vowels_list.each { |vowel| puts vowel }
# end

# hsh = {
#   first: ['the', 'quick'], 
#   second: ['brown', 'fox'], 
#   third: ['jumped'], 
#   fourth: ['over', 'the', 'lazy', 'dog']
# }

# vowels(hsh)

##### 77777
# a = 2
# b = [5, 8]
# arr = [a, b] # [2, [5, 8]]

# arr[0] += 2 # [4, [5, 8]]
# arr[1][0] -= a # [4, [3, 8]]

# p arr # [4, [3, 8]]
# p a # 2
# p b # [3, 8]

##### 66666
# def display_family_info(family)
#   family.each do |name, info|
#     puts "#{name} is a #{info['age']}-year-old #{info['gender']}"
#   end
# end

# # (Name) is a (age)-year-old (male or female).

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# display_family_info(munsters)

##### 55555
# def total_age(family, gender)
#   total = 0
#   family.each_value do |info|
#     total += info['age'] if info['gender'] == gender
#   end
#   total
# end

# def total_age(family, gender)
#   family.each_value.inject(0) do |total, info|
#     addition = info['gender'] == gender ? info['age'] : 0
#     total + addition
#   end
# end

# def total_age(family, gender)
#   family.each_value.map do |info|
#     info['gender'] == gender ? info['age'] : 0
#   end.sum
# end

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# p total_age(munsters, 'male') #== 444

##### 44444
# arr1 = [1, [2, 3], 4]
# # p arr1
# # arr1[1][1] += 1
# # p arr1

# arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
# # p arr2
# # arr2[2] += 1
# # p arr2

# hsh1 = {first: [1, 2, [3]]}
# # p hsh1
# # hsh1[:first][2][0] += 1
# # p hsh1

# hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
# # p hsh2
# # hsh2[['a']][:a][2] += 1
# # p hsh2

##### 33333
# arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

# arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

# arr3 = [['abc'], ['def'], {third: ['ghi']}]

# hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

# hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

# p arr1[2][1][3] == 'g'

# p arr2[1][:third][0] == 'g'

# p arr3[2][:third][0][0] == 'g'

# p hsh1['b'][1] == 'g'

# p hsh2[:third].key(0) == 'g'

##### 22222
# def sort_books(list, criterion)
#   list.sort_by do |book|
#     book[criterion]
#   end
# end

# books = [
#   {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
#   {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
#   {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
#   {title: 'Ulysses', author: 'James Joyce', published: '1922'}
# ]

# p sort_books(books, :published)

# [
#   {:title=>"War and Peace", :author=>"Leo Tolstoy", :published=>"1869"}, 
#   {:title=>"Ulysses", :author=>"James Joyce", :published=>"1922"}, 
#   {:title=>"The Great Gatsby", :author=>"F. Scott Fitzgerald", :published=>"1925"}, 
#   {:title=>"One Hundred Years of Solitude", :author=>"Gabriel Garcia Marquez", :published=>"1967"}
# ]

##### 11111
# arr = ['10', '11', '9', '7', '8']

# sorted = arr.sort do |a, b|
#   b.to_i <=> a.to_i
# end

# p sorted

##### 16161616
# HEX_CHARACTERS = ('0'..'9').to_a + ('a'..'f').to_a
# PATTERN = [8, 4, 4, 4, 12]

# # def generate_uuid
# #   PATTERN.map do |length|
# #     string = ''
# #     length.times { |num| string << HEX_CHARACTERS.sample }
# #     string
# #   end.join('-')
# # end

# def generate_uuid
#   PATTERN.map do |length|
#     length.times.inject('') { |string| string << HEX_CHARACTERS.sample }
#   end.join('-')
# end

# p generate_uuid

##### 15151515
# def only_evens(array)
#   array.select do |hash| # {b: [2, 4, 6], c: [3, 6], d: [4]}
#     hash.values.all? do |array| # [2, 4, 6]
#       array.all? { |num| num.even? } # 2
#     end
#   end
# end

# arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
# p only_evens(arr) ==[{e: [8], f: [6, 10]}]

##### 14141414
# def colors_and_sizes(hash)
#   hash.values.map do |info|
#     info[:type] == 'fruit' ? info[:colors].map(&:capitalize) : info[:size].upcase
#   end
# end

# produce = {
#   'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
#   'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
#   'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
#   'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
#   'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
# }

# p colors_and_sizes(produce) == [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

##### 13131313
# def odd_sort(array)
#   array.sort_by do |subarray|
#     subarray.select(&:odd?)
#   end
# end

# arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]
# p odd_sort(arr) == [[1, 8, 3], [1, 5, 9], [6, 1, 7], [1, 6, 9]]

##### 12121212
# def nested_array_to_hash(array)
#   array.each_with_object({}) do |subarray, hash|
#     key, value = subarray
#     hash[key] = value
#   end
# end

# arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# p nested_array_to_hash(arr) == {
#   :a=>1, 
#   "b"=>"two", 
#   "sea"=>{:c=>3}, 
#   {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"
# }

##### 11111111
# def multiples_of_three(array)
#   array.map do |subarray|
#     subarray.select { |num| num % 3 == 0 }
#   end
# end

# array = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]
# p multiples_of_three(array) == [[], [3, 12], [9], [15]]

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

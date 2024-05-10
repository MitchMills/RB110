### 15
arr = [
  {a: [1, 2, 3]},
  {b: [2, 4, 6], c: [3, 6], d: [4]},
  {e: [8], f: [6, 10]}
]

evens = arr.select do |hash|
  hash.values.all? do |numbers|
    numbers.all? { |number| number.even? }
  end
end

p evens


### 14
# hsh = {
#   'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
#   'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
#   'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
#   'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
#   'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
# }

# def fix(hash)
#   hash.each_value.map do |info|
#     colors = info[:colors].map(&:capitalize)
#     size = info[:size].upcase
#     info[:type] == 'fruit' ? colors : size
#   end
# end

# p fix(hsh) == [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

### 13
# arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

# sorted = arr.sort_by do |subarray|
#   subarray.select { |number| number.odd? }
# end

# p sorted

### 12
# arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# hash = arr.each_with_object({}) do |element, hash|
#   hash[element.first] = element.last
# end

# p hash

# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

### 11
# array = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]

# threes = array.map do |subarray|
#   subarray.select { |number| (number % 3).zero? }
# end

# p array
# p threes

### 10
# info = [
#   {a: 1},
#   {b: 2, c: 3},
#   {d: 4, e: 5, f: 6}
# ]

# info_plus = info.map do |hash|
#   hash.each_with_object({}) do |(key, value), result|
#     result[key] = value + 1
#   end
# end

# info_plus = info.map do |hash|
#   hash.map { |key, value| [key, value + 1] }.to_h
# end

# p info
# p info_plus

### 9
# arr = [
#   ['b', 'c', 'a'],
#   [2, 1, 3],
#   ['blue', 'black', 'green']
# ]

# sorted = arr.map do |subarray|
#   subarray.sort { |a, b| b <=> a }
# end
# # sorted = arr.map { |subarray| subarray.sort.reverse }
# p sorted


### 8
# hsh = {
#   first: ['the', 'quick'],
#   second: ['brown', 'fox'],
#   third: ['jumped'],
#   fourth: ['over', 'the', 'lazy', 'dog']
# }

# hsh.each_value do |words|
#   words.each do |word|
#     word.chars.each { |char| puts char if 'aeiou'.include?(char) }
#   end
# end

### 7
# a = 2
# b = [5, 8]
# arr = [a, b] # [2, [5, 8]]

# arr[0] += 2
# p arr # [4, [5, 8]]
# p a # 2
# p b # [5, 8]
# puts

# arr[1][0] -= a
# p arr # [4, [3, 8]]
# p a # 2
# p b # [3, 8]


### 6
# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 80, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 18, "gender" => "female"}
# }

# munsters.each do |name, info|
#   article = info['age'].to_s.start_with?('8', '18') ? 'an' : 'a'
#   puts "#{name} is #{article} #{info['age']}-year-old #{info['gender']}."
# end

# (Name) is a (age)-year-old (male or female).

### 5
# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# males = munsters.values.select do |info|
#   info['gender'] == 'male'
# end

# male_ages = males.map { |info| info['age'] }.sum


# male_ages = 0
# munsters.each_value do |details|
#   male_ages += details['age'] if details['gender'] == 'male'
# end


# male_ages = munsters.values.filter_map do |info|
#   info['age'] if info['gender'] == 'male'
# end.sum


# male_ages = munsters.values.inject(0) do |total, info|
#   addition = info['gender'] == 'male' ? info['age'] : 0
#   total += addition
# end

# p male_ages

### 4
# arr1 = [1, [2, 3], 4]
# # arr1[1][1] = 4
# arr1[1][1] += 1

# arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
# # arr2[2] = 4
# arr2[2] += 1

# hsh1 = {first: [1, 2, [3]]}
# # hsh1[:first÷][2][0] = 4
# hsh1[:first][2][0] += 1

# hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
# # hsh2[['a']][:a][2] = 4
# hsh2[['a']][:a][2] += 1

# p arr1
# p arr2
# p hsh1
# p hsh2


### 3
# arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

# arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

# arr3 = [['abc'], ['def'], {third: ['ghi']}]

# hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

# hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

# p arr1[2][1][3]
# p arr2[1][:third].first
# p arr3[2][:third].first.chars.first
# p hsh1['b'][1]
# p hsh2[:third].key(0)
# p hsh2[:third].keys.first


### 2
# books = [
#   {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
#   {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
#   {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
#   {title: 'Ulysses', author: 'James Joyce', published: '1922'}
# ]

# published_order = books.sort_by { |book| book[:published] }
# p published_order

# [
#   {:title=>"War and Peace", :author=>"Leo Tolstoy", :published=>"1869"},
#   {:title=>"Ulysses", :author=>"James Joyce", :published=>"1922"},
#   {:title=>"The Great Gatsby", :author=>"F. Scott Fitzgerald", :published=>"1925"},
#   {:title=>"One Hundred Years of Solitude", :author=>"Gabriel Garcia Marquez", :published=>"1967"}
# ]


### 1
# arr = ['10', '11', '9', '7', '8']
# # sorted = arr.sort { |a, b| b.to_i <=> a.to_i }
# sorted = arr.sort_by { |number| number.to_i }.reverse
# p sorted



### SIXTEEN
# SECTIONS = [8, 4, 4, 4, 12]
# HEXADECIMALS = ('0'..'9').to_a + ('a'..'f').to_a

# def generate_uuid
#   SECTIONS.map.with_object('') do |section, uuid|
#     section.times { |time| uuid << HEXADECIMALS.sample }
#     uuid << '-' unless section == 12
#   end
# end

# p generate_uuid


### FIFTEEN
# def even_hashes(array)
#   array.select do |hash|
#     hash.each_value.all? do |value|
#       value.all? { |num| num.even? }
#     end
#   end
# end

# array = [
#   {a: [1, 2, 3]},
#   {b: [2, 4, 6], c: [3, 6], d: [4]},
#   {e: [8], f: [6, 10]}
# ]
# p even_hashes(array)


### FOURTEEN
# def colors_and_sizes(hash)
#   hash.each_value.map do |info|
#     case info[:type]
#     when 'fruit' then (info[:colors]).map(&:capitalize)
#     when 'vegetable' then info[:size].upcase
#     end
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



### THIRTEEN
# def odd_sort(array)
#   array.sort_by do |subarray|
#     subarray.select { |num| num.odd? }
#   end
# end

# array = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]
# p odd_sort(array) == [[1, 8, 3], [1, 5, 9], [6, 1, 7], [1, 6, 9]]



### TWELVE
# def hashify(array)
#   array.each_with_object({}) do |subarray, hash|
#     hash[subarray.first] = subarray.last
#   end
# end

# array = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# p hashify(array) == {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}


### ELEVEN
# def multiples(array)
#   array.map do |subarray|
#     subarray.select { |num| num % 3 == 0 }
#   end
# end

# array = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]
# p multiples(array) == [[], [3, 12], [9], [15]]



### TEN
# original = [
#   {a: 1},
#   {b: 2, c: 3},
#   {d: 4, e: 5, f: 6}
# ]

# def increment(array)
#   array.map do |hash|
#     hash.each_with_object({}) do |(key, value), new_hash|
#       new_hash[key] = value + 1
#     end
#   end
# end

# p original
# p increment(original) #== [{a: 2}, {b: 3, c: 4}, {d: 5, e: 6, f: 7}]
# p original




### NINE
# array = [
#   ['b', 'c', 'a'],
#   [2, 1, 3],
#   ['blue', 'black', 'green']
# ]

# def sort_subarrays(array)
#   array.map do |subarray|
#     subarray.sort { |a, b| b <=> a }
#   end
# end

# p sort_subarrays(array)



### EIGHT
# hsh = {
#   first: ['the', 'quick'],
#   second: ['brown', 'fox'],
#   third: ['jumped'],
#   fourth: ['over', 'the', 'lazy', 'dog']
# }

# def display_vowels(hash)
#   hash.each_value do |words|
#     words.each do |word|
#       word.chars.each { |char| puts char if 'aeiou'.include?(char) }
#     end
#   end
# end

# display_vowels(hsh)


### SEVEN
# a = 2
# b = [5, 8]
# arr = [a, b] # [2, [5, 8]]

# arr[0] += 2 # [4, [5, 8]]
# arr[1][0] -= a # [4, [3, 8]]

# p a # 2
# p b # [3, 8]


### SIX
# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# def display_info(family)
#   family.each do |person, info|
#     name, age, gender = person, info['age'], info['gender']
#     puts "#{name} is a #{age}-year-old #{gender}."
#   end
# end

# display_info(munsters)

### FIVE
# munsters = {
#   "Herman" =>   { "age" => 32,  "gender" => "male"    },
#   "Lily" =>     { "age" => 30,  "gender" => "female"  },
#   "Grandpa" =>  { "age" => 402, "gender" => "male"    },
#   "Eddie" =>    { "age" => 10,  "gender" => "male"    },
#   "Marilyn" =>  { "age" => 23,  "gender" => "female"  }
# }

# def ages(family, subgroup)
#   family.values.inject(0) do |total_age, info|
#     addition = info['gender'] == subgroup ? info['age'] : 0
#     total_age += addition
#   end
# end

# p ages(munsters, "male")


### FOUR
# arr1 = [1, [2, 3], 4]
# arr1[1][1] += 1

# arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
# arr2[2] += 1

# hsh1 = {first: [1, 2, [3]]}
# hsh1[:first][2][0] += 1

# hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
# hsh2[['a']][:a][2] += 1



### THREE
# arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

# arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

# arr3 = [['abc'], ['def'], {third: ['ghi']}]

# hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

# hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

# p arr1[2][1][3]
# p arr2[1][:third][0]
# p arr3[2][:third][0][0]
# p hsh1['b'][1]
# p hsh2[:third].key(0)
# p hsh2[:third].keys.first


### TWO
# books = [
#   {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
#   {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
#   {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
#   {title: 'Ulysses', author: 'James Joyce', published: '1922'}
# ]

# def arrange_books(list, criterion)
#   list.sort_by { |book_info| book_info[criterion.to_sym] }
# end

# p arrange_books(books, 'published')


### ONE
# array = ['10', '11', '9', '7', '8']
# sorted = array.sort do |a, b|
#   b.to_i <=> a.to_i
# end
# p sorted

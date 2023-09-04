##### 5555
def male_ages(family)
  age = 0
  family.each_value { |info| age += info["age"] if info["gender"] == "male" }
  age
end

def male_ages(family)
  males = family.each_value.select { |info| info["gender"] == "male" }
  males.map { |stats| stats["age"] }.sum
end

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# p munsters["Herman"]["age"]
p male_ages(munsters)

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

a = [1, 3]
b = [2]
arr = [a, b]
arr # => [[1, 3], [2]]

### PROBLEM 10
# def add_age_group(family)
#   family.each do |name, data|
#     age_group = case data['age']
#                 when (0..17) then 'kid'
#                 when (18..64) then 'adult'
#                 else 'senior'
#                 end
#     data['age_group'] = age_group
#   end
# end

# kid: 0 - 17
# adult 18 - 64
# senior 65+

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# with_age_group = { "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
# "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
# "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
# "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
# "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }

# p add_age_group(munsters) == with_age_group

### PROBLEM 9
# def titleize(string)
#   string.split.map { |word| word.capitalize }.join(' ')
# end

# words = "the flintstones rock"
# p titleize(words)

### PROBLEM 8
# numbers = [1, 2, 3, 4]
# numbers.each_with_index do |number, index|
#   p "#{index}  #{numbers.inspect}  #{number}"
#   numbers.pop(1)
# end

# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.pop(1)
# end

# numbers = [1, 2, 3, 4]
# numbers.each_with_index do |number, index|
#   p "#{index}  #{numbers.inspect}  #{number}"
#   numbers.shift(1)
# end

# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.shift(1)
# end


### PROBLEM 7
# def lettercount(string)
#   string.each_char.with_object({}) do |char, counts|
#     counts[char] = string.count(char) unless char == ' '
#   end.sort_by { |char, count| char }
# end

# LETTERS = ('A'..'Z').to_a + ('a'..'z').to_a

# def lettercount(string)
#   LETTERS.each_with_object({}) do |letter, tally|
#     count = string.count(letter)
#     tally[letter] = string.count(letter) if count > 0
#   end
# end

# def lettercount(string)
#   string.delete(' ').chars.tally
# end

# statement = "The Flintstones Rock"
# p lettercount(statement)

### PROBLEM 6
# def abbreviate(list, length)
#   list.each do |name|
#     name.replace(name[0, 3])
#   end
# end

# def abbreviate(list, length)
#   list.map! { |name| name[0, 3] }
# end

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# p abbreviate(flintstones, 3)

### PROBLEM 5
# def find_flintstone(list, target)
#   list.index { |name| name.start_with?(target)}
#   # list.each_index.select { |index| list[index].start_with?(target)}.first
# end

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# p find_flintstone(flintstones, 'Be')


### PROBLEM 4
# def minimum_age(list)
#   list.min_by { |name, age| age }.last
#   # list.values.min
#   # list.sort_by { |name, age| age }.first.last
# end

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# p minimum_age(ages)


### PROBLEM 3
# def remove_oldies!(people)
#   people.each do |name, age|
#     people.delete(name) if age >= 100
#   end
# end

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# p remove_oldies!(ages)
# p ages

### PROBLEM 2
# def add_ages(list)
#   list.values.sum
# end

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# p add_ages(ages)

### PROBLEM 1
# def hasherize(array)
#   array.each_index.with_object({}) do |index, hash|
#     current_key = array[index]
#     hash[current_key] = index
#   end
# end

# flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# p hasherize(flintstones)

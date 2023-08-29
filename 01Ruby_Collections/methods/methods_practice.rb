### PROBLEM 10
# a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+

def add_age_range(hash)
  hash.each do |name, info|
    age_group = case info["age"]
                when (0..17) then "kid"
                when (18..64) then "adult"
                when (65..) then "senior"
                end
    
    info["age group"] = age_group
  end
  hash
end

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

p add_age_range(munsters)

result = {
  "Herman"=>{"age"=>32, "gender"=>"male", "age group"=>"adult"}, 
  "Lily"=>{"age"=>30, "gender"=>"female", "age group"=>"adult"}, 
  "Grandpa"=>{"age"=>402, "gender"=>"male", "age group"=>"senior"}, 
  "Eddie"=>{"age"=>10, "gender"=>"male", "age group"=>"kid"}, 
  "Marilyn"=>{"age"=>23, "gender"=>"female", "age group"=>"adult"}
}


### PROBLEM 9
# def titleize(words)
#   words.split.map(&:capitalize).join(' ')
# end

# def titleize(words)
#   words.each_char.with_index.map do |char, index|
#     next char.upcase if index == 0 || words[index - 1] == ' '
#     char
#   end.join
# end

# words = "the flintstones rock"
# p titleize(words)

### PROBLEM 8
# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   p numbers
#   numbers.shift(1)
# end

# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   p numbers
#   numbers.pop(1)
# end

### PROBLEM 7
# def letter_count(string)
#   string.delete(' ').chars.tally
# end

# def letter_count(string)
#   string.delete(' ').each_char.with_object(Hash.new(0)) do |char, counts|
#     counts[char] += 1
#   end
# end

# def letter_count(string)
#   string.delete(' ').each_char.with_object({}) do |char, counts|
#     counts[char] ? counts[char] += 1 : counts[char] = 1
#   end
# end

# def letter_count(string)
#   string.delete(' ').each_char.with_object({}) do |char, counts|
#     counts[char] = string.count(char)
#   end
# end

# statement = "The Flintstones Rock"
# p letter_count(statement)

### PROBLEM 6
# def shorten(names)
#   names.each_with_index { |name, index| names[index] = name[0, 3] }
# end

# def shorten(names)
#   names.map! { |name| name[0, 3] }
# end

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# p shorten(flintstones)
# p flintstones

### PROBLEM 5
# def find_index(array, target)
#   array.each_with_index { |name, index| return index if name.start_with?(target) }
# end

# def find_index(array, target)
#   array.index { |name| name.start_with?(target) }
# end

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# p find_index(flintstones, "Be")

### PROBLEM 4
# def youngest(hash)
#   [hash.rassoc(hash.values.min)].to_h
# end

# def find_youngest(hash)
#   sorted_by_age = hash.sort_by { |name, age| age }.to_h
#   {sorted_by_age.keys.first => sorted_by_age.values.first}
# end

# def find_youngest(hash)
#   youngest = hash[hash.keys.first]
#   hash.each do |key, value|
#     youngest = hash[key] if value < youngest
#   end
#   {hash.key(youngest) => youngest}
# end

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# p find_youngest(ages)

### PROBLEM 3
# def no_olds(hash)
#   hash.reject { |name, age| age >= 100 }
# end

# def no_olds(hash)
#   hash.select { |name, age| age < 100 }
# end

# def no_olds(hash)
#   hash.delete_if { |name, age| age >= 100 }
# end

# def no_olds(hash)
#   hash.keep_if { |name, age| age < 100 }
# end

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# p no_olds(ages)
# p ages

### PROBLEM 2
# def add_ages(hash)
#   hash.values.inject(:+)
# end

# def add_ages(hash)
#   total = 0
#   hash.each_value.map { |age| total += age }
#   total
# end

# def add_ages(hash)
#   hash.values.sum
# end

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# p add_ages(ages)

### PROBLEM 1
# flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# position = 1
# names_and_positions = flintstones.each_with_object({}) do |name, hash|
#   hash[name] = position
#   position +=1
# end

# names_and_positions = flintstones.each_index.with_object({}) do |index, hash|
#   hash[flintstones[index]] = index + 1
# end

# positions = (1..flintstones.size)
# names_and_positions = flintstones.zip(positions).to_h

# p names_and_positions

### PROBLEM %


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

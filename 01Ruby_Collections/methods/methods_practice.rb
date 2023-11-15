### PROBLEM 6


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

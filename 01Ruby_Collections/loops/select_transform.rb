


###### double odd indices: non-mutating
# def double_odd_indices(numbers)
#   index = 0
#   result = []

#   loop do
#     current_number = numbers[index]
#     current_number *= 2 if index.odd?
#     result << current_number
#     index += 1
#     break if index >= numbers.size
#   end

#   result
# end

### double odd indices: MUTATING
# def double_odd_indices(numbers)
#   index = 0
  
#   loop do
#     numbers[index] *= 2 if index.odd?
#     index += 1
#     break if index >= numbers.size
#   end

#   numbers
# end

# my_numbers = [1, 4, 3, 7, 2, 6]

# p my_numbers
# p my_numbers.object_id
# puts
# p double_odd_indices(my_numbers)  # => [1, 8, 3, 14, 2, 12]
# puts
# p my_numbers
# p my_numbers.object_id

###### double_odd_numbers: non-mutating
# def double_odd_numbers(numbers)
#   index = 0
#   result = []

#   loop do
#     current_number = numbers[index]
#     current_number *= 2 if current_number.odd?
#     result << current_number
#     index += 1
#     break if index >= numbers.size
#   end

#   result
# end

### double odd numbers: MUTATING
# def double_odd_numbers(numbers)
#   index = 0

#   loop do
#     numbers[index] *= 2 if numbers[index].odd?
#     index += 1
#     break if index >= numbers.size
#   end

#   numbers
# end

# my_numbers = [1, 4, 3, 7, 2, 6]

# p my_numbers
# p my_numbers.object_id
# puts
# p double_odd_numbers(my_numbers)  # => [2, 4, 6, 14, 2, 6]
# puts
# p my_numbers
# p my_numbers.object_id

###### double_numbers: non-mutating
# def double_numbers(numbers)
#   index = 0
#   doubled_numbers = []

#   loop do
#     current_number = numbers[index]
#     doubled_numbers << current_number * 2
#     index += 1
#     break if index >= numbers.size
#   end

#   doubled_numbers
# end

### double_numbers: MUTATING
# def double_numbers(numbers)
#   index = 0
  
#   loop do
#     numbers[index] *= 2
#     index += 1
#     break if index >= numbers.size
#   end

#   numbers
# end

# my_numbers = [1, 4, 3, 7, 2, 6]

# p my_numbers
# p my_numbers.object_id
# puts
# p double_numbers(my_numbers) # => [2, 8, 6, 14, 4, 12]
# puts
# p my_numbers
# p my_numbers.object_id

###### select fruit: non-mutating
# def select_fruit(produce)
#   items = produce.keys
#   index = 0
#   fruit = {}

#   loop do
#     current_item = items[index]
#     current_category = produce[current_item]
#     if current_category == 'Fruit'
#       fruit[current_item] = current_category
#     end
#     index += 1
#     break if index >= items.size
#   end

#   fruit
# end

### select fruit: MUTATING
# def select_fruit(produce)
#   items = produce.keys
#   index = 0
#   fruit = {}

#   loop do
#     current_item = items[index]
#     current_type = produce[current_item]
#     if current_type == "Fruit"
#       fruit[current_item] = current_type
#       produce.delete(current_item)
#     end
#     index += 1
#     break if index >= items.size
#   end

#   fruit
# end

# produce = {
#   'apple' => 'Fruit',
#   'carrot' => 'Vegetable',
#   'pear' => 'Fruit',
#   'broccoli' => 'Vegetable'
# }

# p produce
# p produce.object_id
# puts
# p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
# puts
# p produce
# p produce.object_id


###### select vowels: non-mutating
# def select_vowels(string)
#   vowels = 'AEIOUaeiou'
#   selected_vowels = ''
#   index = 0

#   loop do
#     current_character = string[index]
#     if vowels.include?(current_character)
#       selected_vowels << current_character
#     end
#     index += 1
#     break if index >= string.size
#   end

#   selected_vowels
# end

### select vowels: MUTATING
# def select_vowels(string)
#   vowels = 'AEIOUaeiou'
#   index = 0
#   selected_vowels = ''

#   loop do
#     current_character = string[index]
#     if vowels.include?(current_character)
#       selected_vowels << current_character
#       string[index] = ''
#     end
#     index += 1
#     break if index >= string.size
#   end
  
#   selected_vowels
# end

# p sentence = 'I wandered lonely as a cloud'
# p sentence.object_id
# puts
# p select_vowels(sentence) #== "Iaeeoeaaou"
# puts
# p sentence
# p sentence.object_id

###### add s: non-mutating
# def add_s(words)
#   plurals = []
#   index = 0

#   loop do
#     current_element = words[index]
#     plurals << (current_element + 's')
#     index += 1
#     break if index >= words.size
#   end

#   plurals
# end

# ### add s: MUTATING
# def add_s(words)
#   index = 0

#   loop do
#     words[index] = words[index] + 's'
#     index += 1
#     break if index >= words.size
#   end
#   words
# end

# fruits = %w(apple banana pear)

# p fruits
# p fruits.object_id
# puts
# p add_s(fruits)
# puts
# p fruits
# p fruits.object_id

###### select all gs: non-mutating
# def get_number_of_gs(string)
#   index = 0
#   number_of_gs = 0

#   loop do
#     current_character = string[index]
#     if current_character == 'g'
#       number_of_gs += 1
#     end
#     index += 1
#     break if index >= string.size
#   end

#   number_of_gs
# end

### select all gs: MUTATING (doesn't really make sense for this program, but wevs)
# def get_number_of_gs(string)
#   index = 0
#   number_of_gs = []

#   loop do
#     current_character = string[index]
#     if current_character == 'g'
#       number_of_gs << string.delete!(current_character)
#     end
#     index += 1
#     break if index >= string.size
#   end

#   number_of_gs.size
# end

# p string = "living laughing loving coding"
# p string.object_id
# puts
# p get_number_of_gs(string)
# puts
# p string
# p string.object_id

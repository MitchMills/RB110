##### multiply, non-mutating
# def multiply(numbers, multiplier)
#   result = []
#   counter = 0

#   loop do
#     break if counter == numbers.size
#     result << numbers[counter] * multiplier
#     counter += 1
#   end

#   result
# end

# my_numbers = [1, 4, 3, 7, 2, 6]
# p multiply(my_numbers, 3) == [3, 12, 9, 21, 6, 18]

##### double odd indices, non-mutating
# def double_odd_indices(numbers)
#   result = []
#   counter = 0

#   loop do
#     break if counter >= numbers.size
#     current_number = numbers[counter]
#     current_number *= 2 if counter.odd?
#     result << current_number
#     counter += 1
#   end

#   result
# end

# my_numbers = [1, 4, 3, 7, 2, 6]
# p double_odd_indices(my_numbers) == [1, 8, 3, 14, 2, 12]

##### doubled numbers: MUTATING
# def double_numbers(numbers)
#   counter = 0

#   loop do
#     break if counter >= numbers.size
#     numbers[counter] *= 2
#     counter += 1
#   end

#   numbers
# end

# p my_numbers = [1, 4, 3, 7, 2, 6]
# p my_numbers.object_id
# p double_numbers(my_numbers) == [2, 8, 6, 14, 4, 12]
# p my_numbers
# p my_numbers.object_id

##### select fruit
# produce = {
#   'apple' => 'Fruit',
#   'carrot' => 'Vegetable',
#   'pear' => 'Fruit',
#   'broccoli' => 'Vegetable'
# }

# def select_fruit(products_hash)
#   fruit = {}
#   counter = 0
#   products = products_hash.keys

#   loop do
#     break if counter == products.size
#     current_product = products[counter]
#     current_category = products_hash[current_product]
#     fruit[current_product] = current_category if current_category == 'Fruit'
#     counter += 1
#   end

#   fruit
# end

# p select_fruit(produce) == {"apple"=>"Fruit", "pear"=>"Fruit"}


###### select letter: non-mutating
# def select_letter(string, target_letter)
#   selected = ''
#   index = 0

#   loop do
#     current_letter = string[index]
#     if current_letter == target_letter
#       selected << current_letter
#     end
#     index += 1
#     break if index >= string.size
#   end

#   selected
# end

### select letter: MUTATING
# def select_letter(string, target_letter)
#   index = 0
#   selected = ''

#   loop do
#     current_letter = string[index]
#     if current_letter == target_letter
#       selected << current_letter
#       string[index] = ''
#     end
#     index += 1
#     break if index >= string.size
#   end

#   selected
# end

# question = 'How many times does a particular character appear in this sentence?'

# p question
# p question.object_id
# puts
# p select_letter(question, 'a') # => "aaaaaaaa"
# puts
# p question
# p question.object_id


###### multiply: non-mutating
# def multiply(numbers, multiplier)
#   multiplied = []
#   index = 0

#   loop do
#     current_number = numbers[index]
#     multiplied << current_number * multiplier
#     index += 1
#     break if index >= numbers.size
#   end

#   multiplied
# end

### multiply: MUTATING
# def multiply(numbers, multiplier)
#   index = 0

#   loop do
#     numbers[index] *= multiplier
#     index += 1
#     break if index >= numbers.size
#   end

#   numbers
# end

# my_numbers = [1, 4, 3, 7, 2, 6]

# p my_numbers
# p my_numbers.object_id
# puts
# p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]
# puts
# p my_numbers
# p my_numbers.object_id

###### general select: non-mutating
# def general_select(product_list, target_type)
#   products = product_list.keys
#   index = 0
#   selected_products = {}

#   loop do
#     current_product = products[index]
#     current_type = product_list[current_product]
#     if current_type == target_type
#       selected_products[current_product] = current_type
#     end
#     index += 1
#     break if index >= products.size
#   end

#   selected_products  
# end

### general select: MUTATING
# def general_select(product_list, target_type)
#   products = product_list.keys
#   index = 0
#   selected_products = {}

#   loop do
#     current_product = products[index]
#     current_type = product_list[current_product]
#     if current_type == target_type
#       selected_products[current_product] = product_list.delete(current_product)
#     end

#     index += 1
#     break if index >= products.size
#   end

#   selected_products
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
# p general_select(produce, 'Fruit')     # => {"apple"=>"Fruit", "pear"=>"Fruit"}
# puts
# p produce
# p produce.object_id

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
#       fruit[current_item] = produce.delete(current_item)
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

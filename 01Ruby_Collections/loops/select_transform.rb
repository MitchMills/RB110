### SELECT LETTER (mutating)
# def select_letter!(string, target)
#   index = 0
#   letters_to_delete = ''

#   loop do
#     break if index >= string.size
#     current_character = string[index]
#     letters_to_delete <<  current_character unless current_character == target
#     index += 1
#   end
#   string.delete!(letters_to_delete)
# end

# p question = 'How many times does a particular character appear in this sentence?'
# select_letter!(question, 'a') #== "aaaaaaaa"
# select_letter!(question, 't') #== "ttttt"
# select_letter!(question, 'z') #== ""
# p question

### SELECT LETTER (non-mutating)
# def select_letter(string, target)
#   index = 0
#   result = ''

#   loop do
#     break if index >= string.size
#     current_letter = string[index]
#     result << current_letter if current_letter == target
#     index += 1
#   end
#   result.size
# end

# question = 'How many times does a particular character appear in this sentence?'
# p select_letter(question, 'a') == "aaaaaaaa".size
# p select_letter(question, 't') == "ttttt".size
# p select_letter(question, 'z') == "".size

### MULTIPLY (mutating)
# def multiply!(numbers, multiplier)
#   index = 0

#   loop do
#     break if index >= numbers.size
#     numbers[index] *= multiplier
#     index += 1
#   end
#   numbers
# end

# p my_numbers = [1, 4, 3, 7, 2, 6]
# multiply!(my_numbers, 3) == [3, 12, 9, 21, 6, 18]
# p my_numbers

### MULTIPLY (non-mutating)
# def multiply(numbers, multiplier)
#   index = 0
#   result = []

#   loop do
#     break if index >= numbers.size
#     current_number = numbers[index]
#     result << current_number * multiplier
#     index += 1
#   end
#   result
# end

# my_numbers = [1, 4, 3, 7, 2, 6]
# p multiply(my_numbers, 3) == [3, 12, 9, 21, 6, 18]


### GENERAL SELECT (mutating)
# def general_select!(list, target)
#   products = list.keys
#   index = 0

#   loop do
#     break if index >= products.size
#     current_product = products[index]
#     current_type = list[current_product]
#     list.delete(current_product) unless current_type == target
#     index += 1
#   end
#   list
# end

# p produce = {
#   'apple' => 'Fruit',
#   'carrot' => 'Vegetable',
#   'pear' => 'Fruit',
#   'broccoli' => 'Vegetable'
# }

# # general_select!(produce, 'Fruit')     # => {"apple"=>"Fruit", "pear"=>"Fruit"}
# # general_select!(produce, 'Vegetable') # => {"carrot"=>"Vegetable", "broccoli"=>"Vegetable"}
# general_select!(produce, 'Meat') # => {}
# p produce

### GENERAL SELECT (non-mutating)
# def general_select(list, target)
#   products = list.keys
#   index = 0
#   result = {}

#   loop do
#     break if index >= products.size
#     current_product = products[index]
#     current_type = list[current_product]
#     result[current_product] = current_type if current_type == target
#     index += 1
#   end
#   result
# end

# produce = {
#   'apple' => 'Fruit',
#   'carrot' => 'Vegetable',
#   'pear' => 'Fruit',
#   'broccoli' => 'Vegetable'
# }

# p general_select(produce, 'Fruit')     # => {"apple"=>"Fruit", "pear"=>"Fruit"}
# p general_select(produce, 'Vegetable') # => {"carrot"=>"Vegetable", "broccoli"=>"Vegetable"}
# p general_select(produce, 'Meat')      # => {}


### DOUBLE ODD INDICES (mutating)
# def double_odd_indices!(numbers)
#   index = 0

#   loop do
#     break if index >= numbers.size
#     numbers[index] *= 2 if index.odd?
#     index += 1
#   end
#   numbers
# end

# numbers = [1, 2, 3]
# p numbers
# p double_odd_indices!(numbers)
# p numbers

### DOUBLE ODD INDICES (non-mutating)
# def double_odd_indices(numbers)
#   index = 0
#   result = []

#   loop do
#     break if index >= numbers.size
#     current_number = numbers[index]
#     current_number *= 2 if index.odd?
#     result << current_number
#     index += 1
#   end
#   result
# end

# numbers = [1, 2, 3]
# p double_odd_indices(numbers)
# p numbers

### DOUBLE ODD NUMBERS (mutating)
# def double_odds!(numbers)
#   index = 0

#   loop do
#     break if index >= numbers.size
#     numbers[index] *= 2 if numbers[index].odd?
#     index += 1
#   end
#   numbers
# end

# p numbers = [1, 2, 3]
# double_odds!(numbers)
# p numbers


### DOUBLE ODD NUMBERS (non-mutating)
# def double_odds(numbers)
#   index = 0
#   result = []

#   loop do
#     break if index >= numbers.size
#     number = numbers[index]
#     number *= 2 if number.odd?
#     result << number
#     index += 1
#   end
#   result
# end

# numbers = [1, 2, 3]
# p double_odds(numbers)
# p numbers

### DOUBLE NUMBERS (mutating)
# def double_numbers!(numbers)
#   index = 0

#   loop do
#     break if index >= numbers.size
#     numbers[index] *= 2
#     index += 1
#   end
#   numbers
# end

# numbers = [1, 2, 3]
# p numbers.object_id
# p double_numbers!(numbers)
# p numbers.object_id

### DOUBLE NUMBERS (non-mutating)
# def double_numbers(numbers)
#   index = 0
#   doubled = []

#   loop do
#     break if index >= numbers.size
#     number = numbers[index]
#     doubled << number * 2
#     index += 1
#   end
#   doubled
# end

# p double_numbers([1, 2, 3])

### SELECT PRODUCE (mutating)
# def select_produce!(list, target_type)
#   products = list.keys
#   index = 0

#   loop do
#     break if index >= products.size
#     current_product = products[index]
#     current_type = list[current_product]
#     list.delete(current_product) unless current_type == target_type
#     index += 1
#   end
#   list
# end

# list = {
#   'apple' => 'Fruit',
#   'carrot' => 'Vegetable',
#   'pear' => 'Fruit',
#   'broccoli' => 'Vegetable'
# }

# p list
# select_produce!(list, "Fruit") # => {"apple"=>"Fruit", "pear"=>"Fruit"}
# p list

### SELECT PRODUCE (non-mutating)
# def select_produce(list, target_type)
#   products = list.keys
#   index = 0
#   result = {}

#   loop do
#     current_product = products[index]
#     current_type = list[current_product]
#     result[current_product] = current_type if current_type == target_type
#     index += 1
#     break if index >= products.size
#   end
#   result
# end

# produce = {
#   'apple' => 'Fruit',
#   'carrot' => 'Vegetable',
#   'pear' => 'Fruit',
#   'broccoli' => 'Vegetable'
# }

# p produce
# p select_produce(produce, "Fruit") # => {"apple"=>"Fruit", "pear"=>"Fruit"}
# p produce

### SELECT VOWELS (mutating)
# def select_vowels!(string)
#   index = 0
#   to_delete = ''
#   loop do
#     character = string[index]
#     to_delete << character unless 'AEIOUaeiou'.include?(character)
#     index += 1
#     break if index >= string.size
#   end
#   string.delete!(to_delete)
# end

### SELECT VOWELS (non-mutating)
# def select_vowels(string)
#   index = 0
#   result = ''
#   loop do
#     current_character = string[index]
#     result << current_character if 'AEIOUaeiou'.include?(current_character)
#     index += 1
#     break if index >= string.size
#   end
#   result
# end

### ADD S (mutating)
# fruits = ['apple', 'banana', 'pear']
# index = 0
# puts "Before: #{fruits.object_id}"
# loop do
#   fruits[index] += 's'
#   index += 1
#   break if index >= fruits.size
# end

# p fruits
# puts "After: #{fruits.object_id}"


### ADD S (non-mutating)
# fruits = ['apple', 'banana', 'pear']
# result = []
# index = 0

# loop do
#   current_fruit = fruits[index]
#   result << current_fruit + 's'
#   index += 1
#   break if index >= fruits.size
# end

# p result

### SELECT A CHARACTER (non-mutating)
# alphabet = 'abcdefghijklmnopqrstuvwxyz'
# index = 0
# selection = ''

# loop do
#   current_character = alphabet[index]
#   selection << current_character if current_character == 'g'
#   index += 1
#   break if index == alphabet.size
# end

# p selection



### SELECT PRODUCE (mutating)
# def select_produce!(list, target_type)
#   products = list.keys
#   index = 0
#   products_to_delete = []

#   loop do
#     current_product = products[index]
#     current_type = list[current_product]
#     products_to_delete << current_product unless current_type == target_type
#     index += 1
#     break if index >= list.size
#   end
#   products_to_delete.each { |product| list.delete(product) }
#   list
# end

# list = {
#   'apple' => 'Fruit',
#   'carrot' => 'Vegetable',
#   'pear' => 'Fruit',
#   'broccoli' => 'Vegetable'
# }

# p list.object_id
# select_produce!(list, "Fruit") # => {"apple"=>"Fruit", "pear"=>"Fruit"}
# p list.object_id


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

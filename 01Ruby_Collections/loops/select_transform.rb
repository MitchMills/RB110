

### DOUBLE ODD NUMBERS, MUTATING
# def double_odd_numbers!(numbers)
#   current_index = 0

#   loop do
#     break if current_index >= numbers.size
#     numbers[current_index] *= 2 if numbers[current_index].odd?
#     current_index += 1
#   end

#   numbers
# end

# my_numbers = [1, 4, 3, 7, 2, 6]
# p double_odd_numbers!(my_numbers) == [2, 4, 6, 14, 2, 6]
# p my_numbers == [2, 4, 6, 14, 2, 6]

### DOUBLE ODD NUMBERS, NON-MUTATING
# def double_odd_numbers(numbers)
#   doubled = []
#   current_index = 0

#   loop do
#     break if current_index >= numbers.size
#     current_number = numbers[current_index]
#     doubled << (current_number.odd? ? current_number * 2 : current_number)
#     current_index += 1
#   end

#   doubled
# end

# my_numbers = [1, 4, 3, 7, 2, 6]
# p double_odd_numbers(my_numbers) == [2, 4, 6, 14, 2, 6]
# p my_numbers == [1, 4, 3, 7, 2, 6]

### DOUBLE NUMBERS, MUTATING
# def double_numbers!(numbers)
#   current_index = 0

#   loop do
#     break if current_index >= numbers.size
#     numbers[current_index] *= 2
#     current_index += 1
#   end

#   numbers
# end

# my_numbers = [1, 4, 3, 7, 2, 6]
# p double_numbers!(my_numbers) == [2, 8, 6, 14, 4, 12]
# p my_numbers

### DOUBLE NUMBERS, NON-MUTATING
# def double_numbers(numbers)
#   doubles = []
#   current_index = 0

#   loop do
#     break if current_index >= numbers.size
#     doubles << numbers[current_index] * 2
#     current_index += 1
#   end
#   doubles
# end

# my_numbers = [1, 4, 3, 7, 2, 6]
# p double_numbers(my_numbers) == [2, 8, 6, 14, 4, 12]
# p my_numbers

### REMOVE FRUIT, MUTATING
# def remove_fruit(produce)
#   items = produce.keys
#   current_index = 0
#   removed = {}

#   loop do
#     break if current_index >= items.size
#     current_item = items[current_index]
#     category = produce[current_item]
#     removed[current_item] = category if category == 'Fruit'
#     produce.delete(current_item) if category == 'Fruit'
#     current_index += 1
#   end

#   removed
# end

# produce = {
#   'apple' => 'Fruit',
#   'carrot' => 'Vegetable',
#   'pear' => 'Fruit',
#   'broccoli' => 'Vegetable'
# }

# p remove_fruit(produce) == {"apple"=>"Fruit", "pear"=>"Fruit"}
# p produce

### SELECT FRUIT, NON-MUTATING
# def select_fruit(produce)
#   fruit = {}
#   items = produce.keys
#   current_index = 0

#   loop do
#     break if current_index >= items.size
#     current_item = items[current_index]
#     category = produce[current_item]
#     fruit[current_item] = category if category == 'Fruit'
#     current_index += 1
#   end
#   fruit
# end

# produce = {
#   'apple' => 'Fruit',
#   'carrot' => 'Vegetable',
#   'pear' => 'Fruit',
#   'broccoli' => 'Vegetable'
# }

# p select_fruit(produce) == {"apple"=>"Fruit", "pear"=>"Fruit"}
# p produce

### REMOVE VOWELS, MUTATING
# def remove_vowels(string)
#   vowels = 'AEIOUaeiou'
#   current_index = 0
#   control_string = string.dup
#   deleted = ''

#   loop do
#     break if current_index >= control_string.size
#     current_character = control_string[current_index]
#     if vowels.include?(current_character)
#       deleted << current_character
#       string.delete!(current_character)
#     end
#     current_index += 1
#   end
  
#   deleted
# end

# string = 'The quick brown fox jumps over the lazy dog.'
# p remove_vowels(string)
# p string

### COUNT VOWELS, NON-MUTATING
# def count_vowels(string)
#   vowels = 'AEIOUaeiou'
#   result = []
#   current_index = 0
#   loop do
#     break if current_index >= string.size
#     current_character = string[current_index]
#     result << current_character if vowels.include?(current_character)
#     current_index += 1
#   end
#   result.size
# end

# string = "The quick brown fox jumps over the lazy dog"
# p count_vowels(string)
# p string

### ADD S, MUTATING
# def pluralize!(words)
#   current_index = 0

#   loop do
#     break if current_index >= words.size
#     words[current_index] += 's'
#     current_index += 1
#   end

#   words
# end

# fruits = ['apple', 'banana', 'pear']
# p pluralize!(fruits)
# p fruits

### ADD S, NON-MUTATING
# def pluralize(words)
#   current_index = 0
#   plurals = []

#   loop do
#     break if current_index >= words.size
#     plurals << words[current_index] + 's'
#     current_index += 1
#   end

#   plurals
# end

# fruits = ['apple', 'banana', 'pear']
# p pluralize(fruits)
# p fruits

### SELECT LETTERS, MUTATING
# def delete_letter(string, target)
#   index = 0
#   original_size = string.size
#   control_string = string.dup

#   loop do
#     break if index >= control_string.size
#     current_character = control_string[index]
#     string.delete!(current_character) if current_character == target
#     index += 1
#   end

#   original_size - string.size
# end

# string = 'the quick brown fox jumps over the lazy dog'
# p delete_letter(string, 't')
# p string

### SELECT LETTERS, NON-MUTATING
# def count_letter(string, target)
#   current_index = 0
#   result = ''

#   loop do
#     break if current_index >= string.size
#     current_letter = string[current_index]
#     result << current_letter if current_letter == target
#     current_index += 1
#   end

#   result.size
# end

# p count_letter('the coming and the going', 'z')

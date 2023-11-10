

### SELECT VOWELS, MUTATING
# def grab_vowels(string)
#   vowels = 'AEIOUaeiou'
#   current_index = 0
#   original_size = string.size

#   loop do
#     break if current_index >= string.size
#     current_character = string[current_index]
#     string.delete!(current_character) if vowels.include?(current_character)
#     current_index += 1
#   end
  
#   original_size - string.size
# end

# string = 'The quick brown fox jumps over the lazy dog.'
# p grab_vowels(string)
# p string

### SELECT VOWELS, NON-MUTATING
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
# p select_vowels(string)
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
# def grab_letters(string, target)
#   index = 0
#   original_size = string.size

#   loop do
#     break if index >= string.size
#     current_character = string[index]
#     string.delete!(current_character) if current_character == target
#     index += 1
#   end
#   original_size - string.size
# end

# string = 'the quick brown fox jumps over the lazy dog'
# p grab_letters(string, 'o')

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

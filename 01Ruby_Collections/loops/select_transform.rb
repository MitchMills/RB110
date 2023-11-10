def get_all_substrings1(string)
  substrings = []

  final_index = string.size - 1

  (0..final_index).each do |start_index| # outer loop
    max_length = string.size - start_index

    (1..max_length).each do |current_length| # inner loop
      substrings << string[start_index, current_length]
    end
  end

  substrings
end

p get_all_substrings1('abcde') # => ["a", "ab", "abc", "abcd", "abcde", "b", "bc", "bcd", "bcde", "c", "cd", "cde", "d", "de", "e"]


def get_all_substrings2(string)
  substrings = []

  max_length = string.size

  (1..max_length).each do |current_length| # outer loop
    final_index = string.size - current_length

    (0..final_index).each do |start_index| # inner loop
      substrings << string[start_index, current_length]
    end
  end

  substrings
end

p get_all_substrings2('abcde') # => ["a", "b", "c", "d", "e", "ab", "bc", "cd", "de", "abc", "bcd", "cde", "abcd", "bcde", "abcde"]


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

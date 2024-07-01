### SEVEN
=begin
Create a method that takes an array of integers as an argument and returns the number of identical pairs of integers in that array. For instance, the number of identical pairs in [1, 2, 3, 2, 1] is 2: there are two occurrences each of both 2 and 1.

If the array is empty or contains exactly one value, return 0.

If a certain number occurs more than twice, count each complete pair once. For instance, for [1, 1, 1, 1] and [2, 2, 2, 2, 2], the method should return 2. The first array contains two complete pairs while the second has an extra 2 that isn't part of the other two pairs.

PROBLEM 9:09
input: array
  - elements are integers
  - some integers may be repeated
  - may be empty
  - may contain only 1 value

output: integer
  - represents the number of 'identical pairs'
    - an identical pair contains the same two numbers
    - numbers need not be contiguous
  - if no identical pairs, return 0
    - an empty input array
    - an array with only one element
    - an array with no repeated numbers
  - count only 'complete' pairs
    - if there are 5 occurrences of a number, there are only 2 complete pairs

EXAMPLES

DATA STRUCTURES
needs:
  - way to count occurrences of each unique number
  - way to determine 'complete' pairs

start: array
  - array of unique integers from input array: uniques
  - transformed unique array: counts for each unique integer: pairs
  - transformed counts array: each count divided by 2: pair_counts
finish: integer: sum of pair_counts array

ALGORITHM
- create an array of the unique values in the input array
- transform this array into counts of the occurrences of each unique value
- transform counts array: divide each value by 2 (integer division)
- return the sum of that array
=end

def pairs(numbers)
  uniques = numbers.uniq
  counts = uniques.map { |number| numbers.count(number) }
  pair_count = counts.map { |count| count / 2 }
  pair_count.sum
end

def pairs(numbers)
  numbers.uniq.map { |number| numbers.count(number) / 2 }.sum
end

p pairs([3, 1, 4, 5, 9, 2, 6, 5, 3, 5, 8, 9, 7]) == 3
p pairs([2, 7, 1, 8, 2, 8, 1, 8, 2, 8, 4]) == 4
p pairs([]) == 0
p pairs([23]) == 0
p pairs([997, 997]) == 1
p pairs([32, 32, 32]) == 1
p pairs([7, 7, 7, 7, 7, 7, 7]) == 3

### SIX
=begin
Create a method that takes a string argument and returns a hash in which the keys represent the lowercase letters in the string, and the values represent how often the corresponding letter occurs in the string.

PROBLEM 8:32
input: string
  - may contain both lower and uppercase letter characters
  - may contain punctuation, whitespace
  - may be empty
  - may contain 0 lowercase letters

output: hash
  - keys: each lowercase letter in string (as a string)
  - values: number of occurrences of that letter
  - if no lowercase letters in input string, return empty hash
    - empty, or only uppercase, punctuation, etc

EXAMPLES

DATA STRUCTURES
needs:
  - way to consider each character in input string
  - way to distinguish lowercase letters from any other letters
  - way to count occurrences of lowercase letters

start: string
  - array of all lowercase alphabetic characters
  - empty hash, default value of 0
  - array of individual characters
  - conditional
    - if lowercase, add to hash count
    - else ignore
finish: hash

ALGORITHM
- create an array of all lowercase alphabetic characters: LOWERCASE
- create an empty hash, with a default value of 0: counts
- create an array of individual characters from the input string
  - for each character:
    - if it is not lowercase, go to the next character
    - if it is lowercase, increment that letter in counts hash
- return the counts hash
=end

# LOWERCASE = ('a'..'z').to_a

# def count_letters(string)
#   counts = Hash.new(0)
#   string.chars.each do |char|
#     counts[char] += 1 if LOWERCASE.include?(char)
#   end
#   counts
# end

# expected = {'w' => 1, 'o' => 2, 'e' => 3, 'b' => 1, 'g' => 1, 'n' => 1}
# p count_letters('woebegone') == expected

# expected = {'l' => 1, 'o' => 1, 'w' => 1, 'e' => 4, 'r' => 2,
#             'c' => 2, 'a' => 2, 's' => 2, 'u' => 1, 'p' => 2}
# p count_letters('lowercase/uppercase') == expected

# expected = {'u' => 1, 'o' => 1, 'i' => 1, 's' => 1}
# p count_letters('W. E. B. Du Bois') == expected

# p count_letters('x') == {'x' => 1}
# p count_letters('') == {}
# p count_letters('!!!') == {}

### FIVE
=begin
Create a method that takes a string argument and returns the character that occurs most often in the string. If there are multiple characters with the same greatest frequency, return the one that appears first in the string. When counting characters, consider uppercase and lowercase versions to be the same.

PROBLEM 9:11
input: string
  - contains upper and lowercase letters
output: string
  - most frequent character
    - case insensitive: 'a' == 'A' in terms of counting
    - returned character should be lower case
  - if any ties, return character that appears first in the string

EXAMPLES

DATA STRUCTURES
needs:
  - way to consider each character
  - way to count occurrences of every character
    - way to treat different case characters as the same character
  - way to find the earliest character with the highest count

start: string
  - array of individual characters
  - hash with character counts?
finish: one-character string

ALGORITHM
- create an array of the downcased individual characters in the string
- examine each character
  - get the number of times the downcased version of that character occurs in the downcased string
  - return the earliest character with the highest number of occurences
=end

# def most_common_char(string)
#   lowercase = string.downcase
#   lowercase.chars.max_by { |char| lowercase.count(char) }
# end

# p most_common_char('Hello World') == 'l'
# p most_common_char('Mississippi') == 'i'
# p most_common_char('Happy birthday!') == 'h'
# p most_common_char('aaaaaAAAA') == 'a'

# my_str = 'Peter Piper picked a peck of pickled peppers.'
# p most_common_char(my_str) == 'p'

# my_str = 'Peter Piper repicked a peck of repickled peppers. He did!'
# p most_common_char(my_str) == 'e'

### FOUR
=begin
Create a method that takes an array of integers as an argument and returns an array of two numbers that are closest together in value. If there are multiple pairs that are equally close, return the pair that occurs first in the array.

PROBLEM 5:12
input: array
  - elements are integers
output: array
  - contains two integers:
    - the two from input array that are closest in value
      - need not be contiguous
    - return first pair if there are more than one pair equally close
      - presumably: which pair's first number occurs first

EXAMPLES

DATA STRUCTURES
needs:
  - a way to compare each number to every other number
  - a way to get the difference in value between each pair
  - a way to identify the pair with the smallest difference

start: array
  - array of all possible pairs
    - no need for 'reverse' pairs: [5, 25] and not [25, 5]
    - first number index: from 0 up to (array length - 1)
    - second number index: (current index + 1) up to (array length - 1)
  - pairs array sorted by difference between its elements
output: array (smallest difference pair)

ALGORITHM
- get all possible pairs:
  - create an empty array to hold pairs: pairs
  - create a range from 0 up to (array length - 1): index1
    - for each number in index1
      - create a range from (index1 + 1) up to (array length - 1): index2
      - add an array with elements at index 1 and index 2 to pairs
- return the pair with the smallest difference between its elements
=end

# def closest_numbers(array)
#   pairs = get_pairs(array)
#   pairs.min_by { |pair| pair.inject(:-).abs }
# end

# def get_pairs(array)
#   pairs = []
#   last_index = array.size - 1

#   (0..last_index).each do |index1|
#     ((index1 + 1)..last_index).each do |index2|
#       pairs << [array[index1], array[index2]]
#     end
#   end

#   pairs
# end

# p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
# p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
# p closest_numbers([12, 22, 7, 17]) == [12, 7]

### THREE
=begin
Create a method that takes a string argument and returns a copy of the string with every second character in every third word converted to uppercase. Other characters should remain the same.

PROBLEM 4:40
input: string

output: new string
  - in every third word
    - every second character converted to uppercase
      - if less than two characters, word is unchanged
    - 'word' = contiguous string of non-space characters
  - all other characters remain the same

EXAMPLES

DATA STRUCTURES
needs:
  - way to access each individual word
    - way to identify every third word
  - way to access each indvidual character in third words
    - way to identify every second character
    - way to change case of appropriate characters

start: string
  - array of individual words
    - with indexes
      - (index + 1) % 3 == 0?
  - array of individual characters for every third word
    - with indexes
      - is index odd?
  - transformed array of individual characters of every third word
  - transformed array of individual words
finish: new string

ALGORITHM
- create an array of individual words from input string
- transform words array:
  - for every word and its index
    - check whether it is a 'third word'
      - is (index + 1) evenly divisible by 3?

      - if yes
        - create an array of individual characters from that word
        - transform characters array:
          - check whether it is a 'second character'
            - is index odd?
          - if yes
            - uppercase that character
          - if no
            - do nothing

      - if no
        - do nothing

- convert words array into a string and return it
=end

# def to_weird_case(string)
#   words = string.split
#   weird_words = words.map.with_index do |word, index|
#     (index + 1) % 3 == 0 ? change_word(word) : word
#   end
#   weird_words.join(' ')
# end

# def change_word(word)
#   characters = word.chars
#   characters.map.with_index do |character, index|
#     index.odd? ? character.upcase : character
#   end.join
# end

# original = 'Lorem Ipsum is simply dummy text of the printing world'
# expected = 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG world'
# p to_weird_case(original) == expected

# original = 'It is a long established fact that a reader will be distracted'
# expected = 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
# p to_weird_case(original) == expected

# p to_weird_case('aaA bB c') == 'aaA bB c'

# original = "Mary Poppins' favorite word is supercalifragilisticexpialidocious"
# expected = "Mary Poppins' fAvOrItE word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS"
# p to_weird_case(original) == expected

### TA SESSION
=begin
Implement a function that calculates the sum of numbers inside of a string.

You can expect that the string will include only positive numbers.

PROBLEM 10:00
input: string
  - contains one or more numeric characters
  - mixed in with non-numeric characters (letters, spaces, etc)
output: integer
  - sum of all 'numbers' in input string
    - 'number' is a contiguous string of numeric characters
    - multiple numeric charactes in a row represents a multi-digit number
    - only positive numbers are represented

EXAMPLES

DATA STRUCTURES
needs:
  - a way to determine if a character is numeric
  -  a way to separate numeric characters from other characters
  * a way to keep contiguous strings of numeric characters together
  - a way to convert numeric characters into integers
  - a way to sum all the integers

start: string
  - array of all numeric characters
  - empty array to hold numeric strings
  - empty string to add numeric characters to
  - array of all numeric strings
  - array of integers
finish: integer (sum)

ALGORITHM
- create a constant: an array of all numeric characters: NUMERICS
- create an empty array to hold numeric strings: numeric_strings
- create an empty string to hold numeric characters: num_string

- iterate over each character of the input string
  - if current character is numeric
    - add character to num_string
  - if current charact is NOT numeric
    - add num_string to numeric_strings array
      - unless num_string is empty
    - reset num_string to empty

- add num_string to numeric_strings
  - unless num_string is empty

- transform numeric_strings into integers
- return the sum of those integers
=end

# NUMERICS = ('0'..'9').to_a

# def sum_of_numbers(string)
#   numeric_strings = get_numeric_strings(string)
#   integers = numeric_strings.map(&:to_i)
#   integers.sum
# end

# def get_numeric_strings(string)
#   numeric_strings = []
#   num_string = ''

#   string.each_char do |char|
#     if NUMERICS.include?(char)
#       num_string << char
#     else
#       numeric_strings << num_string unless num_string.empty?
#       num_string = ''
#     end
#   end

#   numeric_strings << num_string unless num_string.empty?
#   numeric_strings
# end

# p sum_of_numbers("L12aun3ch Sch3oo451") == 469
# p sum_of_numbers("HE2LL3O W1OR5LD") == 11
# p sum_of_numbers("The30quick20brown10f0x1203jumps914ov3r1349the102l4zy dog") == 3635

### TWO
=begin
Create a method that takes an array of integers as an argument. The method should return the minimum sum of 5 consecutive numbers in the array. If the array contains fewer than 5 elements, the method should return nil.

PROBLEM 7:40
input: array
  - elements are integers

- output: integer or nil
  - nil if input array contains fewer than 5 elements
  - otherwise: smallest sum of 5 consecutive elements in array

EXAMPLES

DATA STRUCTURES
needs:
  - way to get all five-element subarrays from input array
    - way to sum subarrays
  - way to return nil if length < 5

start: array
  - array of all possible 5-element subarrays
  - array of sums of those subarrays
  - smallest sum
finish: integer or nil

ALGORITHM
- return `nil` if input array length < 5
- get all possible 5-element subarrays
  - start at index 0, up to array length - 5
  - length is always 5
- transform into an array of sums
- return smallest sum
=end

# def minimum_sum(numbers)
#   subarrays = get_subarrays(numbers)
#   sums = subarrays.map(&:sum)
#   sums.min
# end

# def get_subarrays(array)
#   last_index = array.size - 5
#   (0..last_index).map do |start_index|
#     array[start_index, 5]
#   end
# end

# p minimum_sum([1, 2, 3, 4]) == nil
# p minimum_sum([1, 2, 3, 4, 5, -5]) == 9
# p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
# p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
# p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

### ONE
=begin
Create a method that takes an array of numbers as an argument. For each number, determine how many numbers in the array are smaller than it, and place the answer in an array. Return the resulting array.

When counting numbers, only count unique values. That is, if a number occurs multiple times in the array, it should only be counted once.

PROBLEM 7:16
input: array
  - elements are numbers

output: array
  - each element is based on:
    - how many unique number in input array are smaller than
      - the number at that position in the input array
    - can be 0
  - only consider unique values
    - if a number occurs multiple times in input array
      - only count it once in terms of how many numbers are smaller than
        - current number under consideration
  - same size as input array

EXAMPLES

DATA STRUCTURES
needs:
  - way to count how many unique array numbers are smaller than current number
  - way to consider only unique values when counting

start: array
  - array of unique values
  - transformed input array
finish: array

[8, 1, 2, 2, 3] # input
[8, 1, 2, 3]    # uniques


ALGORITHM
- create an array containing only unique numbers from input array: `uniques`
- for each number in input array
  - count how many numbers in `uniques` are smaller
  - transform number into that count
- return the transformed array
=end

# def smaller_numbers_than_current(numbers)
#   uniques = numbers.uniq
#   numbers.map do |number|
#     uniques.count { |unique| number > unique }
#   end
# end

# p smaller_numbers_than_current([8, 1, 2, 2, 3]) == [3, 0, 1, 1, 2]
# p smaller_numbers_than_current([7, 7, 7, 7]) == [0, 0, 0, 0]
# p smaller_numbers_than_current([6, 5, 4, 8]) == [2, 1, 0, 3]
# p smaller_numbers_than_current([1]) == [0]

# my_array = [1, 4, 6, 8, 13, 2, 4, 5, 4]
# result   = [0, 2, 4, 5, 6,  1, 2, 3, 2]
# p smaller_numbers_than_current(my_array) == result

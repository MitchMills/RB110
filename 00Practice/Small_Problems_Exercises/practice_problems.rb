


### ELEVEN
=begin
Create a method that takes a nonempty string as an argument and returns an array consisting of a string and an integer. If we call the string argument s, the string component of the returned array t, and the integer component of the returned array k, then s, t, and k must be related to each other such that s == t * k. The values of t and k should be the shortest possible substring and the largest possible repeat count that satisfies this equation.

You may assume that the string argument consists entirely of lowercase alphabetic letters.

PROBLEM 3:51
input: string: `string`
  - not empty
  - contains only lowercase alphabetic letters

output: array
  - two elements
    - string: `substring`
      - substring of input string
      - can == entire input string
    - integer: `repeat_count`
      - represents times `substring` is multiplied to equal `string`
      - can be 1 (if `substring` == entire input string)
    - must satisfy: `substring` * `repeat_count` == `string`
      - `substring` should be shortest possible substring
      - `repeat_count` should be highest possible number

EXAMPLES

DATA STRUCTURES
needs:
  - way to generate potential substrings
    - all will start at index 0
    - length can be from 1 up to input string length
  - way to determine potential repeat count
    - string length / substring length
  - way to test whether substring * repeat_count equals string
    - substring * repeat_count == string

start: string
  - array of all possible substrings
    - all start at index 0
    - length: from 1 up to input string length
  - array of all substrings sorted by length (shortest to longest)
  - repeat_count: input string length / current substring length
finish: [substring, repeat_count]
  - first substring which return true to:
    - substring * repeat_count == string]

ALGORITHM
- get all possible substrings from first index
  - create an empty array to hold substrings: substrings
  - get all possible length substrings that start at index 0
    - lengths: from 1 up to input string length
      - for each length
        - add appropriate substring to `substrings` array
          - string[0, current length]
- find shortest substring that satisfies formula
  - transform into a nested array
    - repeat count = string length / substring length
    - [substring, repeat_count]

  - for each subarray
    - test: substring * repeat_count == string
    - return first subarray that satisfies test
=end

# def repeated_substring(string)
#   substrings = get_substrings(string)
#   candidates = get_candidates(substrings)
#   candidates.find { |candidate| candidate.inject(:*) == string }
# end

# def get_substrings(string)
#   substrings = []
#   max_length = string.size
#   (1..max_length).each do |current_length|
#     substrings << string[0, current_length]
#   end
#   substrings
# end

# def get_candidates(substrings)
#   substrings.map do |substring|
#     repeat_count = substrings.last.size / substring.size
#     [substring, repeat_count]
#   end
# end

####
# def repeated_substring(string)
#   1.upto(string.size).each do |current_length|
#     current_substring = string[0, current_length]
#     repeat_count = string.length / current_length
#     pair = [current_substring, repeat_count]
#     return pair if pair.inject(:*) == string
#   end
# end

# p repeated_substring('xyzxyzxyz') == ['xyz', 3]
# p repeated_substring('xyxy') == ['xy', 2]
# p repeated_substring('xyz') == ['xyz', 1]
# p repeated_substring('aaaaaaaa') == ['a', 8]
# p repeated_substring('superduper') == ['superduper', 1]

### TEN
=begin
Create a method that takes a string of digits as an argument and returns the number of even-numbered substrings that can be formed. For example, in the case of '1432', the even-numbered substrings are '14', '1432', '4', '432', '32', and '2', for a total of 6 substrings.

If a substring occurs more than once, you should count each occurrence as a separate substring.

PROBLEM 3:20
input: string
  - contains only numeric characters

output: integer
  - represents number of even-numbered substrings that can be created
    - repetitions are included in count
    - substring can equal entire input string
  - can be 0
    - if no even number in input string

EXAMPLES

DATA STRUCTURES
needs:
  - way to get all possible substrings
  - way to determine which substrings represent even numbers
  - way to count number of even-numbered substrings

start: string
  - array of all possible substrings
  - filtered array: only even-numbered substrings
finish: integer (size of filtered array)

ALGORITHM
- get all possible substrings
  - create an empty array to hold substrings
  - consider each starting index
    - from 0 up to (string length - 1)

  - get all possible substrings from that starting index
    - use length
      - from 1 up to (string length - current starting index)
  - add substrings to substring array
    - string[starting index, current length]

- find even-numbered substrings
  - for each substring
    - convert it to an integer
    - select it if it is even
    - ignore otherwise
- return number of even-numbered substrings
  - size of even-numbered substrings array
=end

# def even_substrings(string)
#   substrings = get_substrings(string)
#   even_numbered_substrings = substrings.select do |substring|
#     substring.to_i.even?
#   end
#   even_numbered_substrings.size
# end

# def get_substrings(string)
#   substrings = []
#   last_index = string.size - 1

#   (0..last_index).each do |start_index|
#     max_size = string.size - start_index

#     (1..max_size).each do |length|
#       substrings << string[start_index, length]
#     end
#   end
#   substrings
# end

####
# def even_substrings(string)
#   even_substrings = get_even_substrings(string)
#   even_substrings.size
# end

# def get_even_substrings(string)
#   substrings = []
#   last_index = string.size - 1

#   (0..last_index).each do |start_index|
#     add_even_substrings(string, start_index, substrings)
#   end

#   substrings
# end

# def add_even_substrings(string, start_index, substrings)
#   max_size = string.size - start_index
#   (1..max_size).each do |length|
#     current_substring = string[start_index, length]
#     substrings << current_substring if current_substring.to_i.even?
#   end
# end

# p even_substrings('1432') == 6
# p even_substrings('3145926') == 16
# p even_substrings('2718281') == 16
# p even_substrings('13579') == 0
# p even_substrings('143232') == 12

### NINE
=begin
Create a method that takes two string arguments and returns the number of times that the second string occurs in the first string. Note that overlapping strings don't count: 'babab' contains 1 instance of 'bab', not 2.

You may assume that the second argument is never an empty string.

PROBLEM 1:13
input: 2 strings
  - first string can be empty
  - second string is never empty

output: integer
  - represents number of times that 2nd string occurs in 1st
    - overlapping strings don't count:
      - 'bab' only occurs once in 'babab'
      - i.e. can only count each letter once
  - if first string is empty, return 0

EXAMPLES

DATA STRUCTURES
needs:
  - way to find occurrences of 2nd string in 1st string
  - way to keep track of number of occurrences
  - way to avoid double counting

start: 2 strings
  - counter to track number of matches
  - compare slices from 1st string to 2nd string
    - slice size == 2nd string size
    - index of last character of matching slice ==
      - where to start searching again after match found
finish: integer

ALGORITHM
- create a counter to track matches: matches = 0
- create a counter to track starting index: start_index = 0
- consider each possible start index of string1
  - from 0 up to (string1 length - string2 length): current_index
    - skip this iteration unless current_index == start_index
    - for each current_index
      - compare a slice starting from that index
        - and with the same size as string2
          - to string2: string1[current_index, string2 length] == string2
      - if they match
        - increment matches by 1
        - set start_index to: current_index + string2 length
      - otherwise
        - increment start_index by 1
- return matches
=end

# def count_substrings(string1, string2)
#   matches = 0
#   start_index = 0
#   max_index = string1.size - string2.size

#   (0..max_index).each do |current_index|
#     next unless current_index == start_index
#     length = string2.size

#     if string1[current_index, length] == string2
#       matches += 1
#       start_index = current_index + length
#     else
#       start_index += 1
#     end
#   end

#   matches
# end

# p count_substrings('babab', 'bab') == 1
# p count_substrings('babab', 'ba') == 2
# p count_substrings('babab', 'b') == 3
# p count_substrings('babab', 'x') == 0
# p count_substrings('', 'x') == 0
# p count_substrings('bbbaabbbbaab', 'baab') == 2
# p count_substrings('bbbaabbbbaab', 'bbaab') == 2
# p count_substrings('bbbaabbbbaabb', 'bbbaabb') == 1

### EIGHT
=begin
Create a method that takes a non-empty string as an argument. The string consists entirely of lowercase alphabetic characters. The method should return the length of the longest vowel substring. The vowels of interest are "a", "e", "i", "o", and "u".

PROBLEM 11:00
input: string
  - not empty
  - contains only lowercase alphabetic characteers
output: integer
  - length of longest 'vowel substring'
    - substring consisting solely of vowels
      - vowels: a e i o u
  - can be 0
    - if no vowels in input string

EXAMPLES

DATA STRUCTURES
needs:
  - way to get all vowel substrings from input string
  - way to determine longest vowel substring

start: string
  - array of all possible substrings
  - array of all vowel substrings
  - transformed array: lengths
  - largest length
finish: integer

ALGORITHM
- get all possible substrings
  - create an empty array to hold substrings
  - create a range to represent starting index
    - start at index 0, then index 1, up to final index
      - final index: (string length - 1)

    - create a range to represent current length
      - start at length 1, up to maximum length
        - maximum length: string length - current index
    - add string[starting index, current length] to substrings array
- get all vowel substrings
  - select only substrings that contain only vowels (a e i o u)
- get length of longest vowel substrings
=end

# def longest_vowel_substring(string)
#   substrings = get_substrings(string)
#   vowel_substrings = substrings.select do |substring|
#     substring.each_char.all? { |char| 'aeiou'.include?(char) }
#   end
#   largest = vowel_substrings.max_by(&:size) || ''
#   largest.size
# end

# def get_substrings(string)
#   substrings = []
#   final_index = string.size - 1

#   (0..final_index).each do |start_index|
#     max_length = string.size - start_index

#     (1..max_length).each do |length|
#       substrings << string[start_index, length]
#     end
#   end
#   substrings
# end

# p longest_vowel_substring('cwm') == 0
# p longest_vowel_substring('many') == 1
# p longest_vowel_substring('launchschoolstudents') == 2
# p longest_vowel_substring('eau') == 3
# p longest_vowel_substring('beauteous') == 3
# p longest_vowel_substring('sequoia') == 4
# p longest_vowel_substring('miaoued') == 5

### FOURTEEN
=begin
Create a method that takes a single integer argument and returns the sum of all the multiples of 7 or 11 that are less than the argument. If a number is a multiple of both 7 and 11, count it just once.

For example, the multiples of 7 and 11 that are below 25 are 7, 11, 14, 21, and 22. The sum of these multiples is 75.

If the argument is negative, return 0.

PROBLEM 10:40
input: integer
  - can be positive, 0, or negative
  - if negative, return 0
  - if 0, return 0

output: integer
  - sum of all multiples of 7 or 11 that are
    - less than input integer
    - only count a particular multiple once:
      - if multiple of both 7 and 11, count it just once

EXAMPLES

DATA STRUCTURES
needs:
  - way to consider every number between 7 and (input integer - 1)
  - way to determine if a multiple of 7 or 11
  - way to exclude double counting
    - if multiple of BOTH 7 and 11

start: integer
  - range: from 7 up to integer - 1
  - array of all multiples of 7 or 11 from that range
  - sum of multiples array
finish: integer

ALGORITHM
- create a range from 7 up to (input integer - 1)
- for every number in that range
  - select it if it is a multiple of 7 or a multiple of 11
- get the sum of that array
=end

# # def seven_eleven(number)
# #   multiples = (7...number).select { |num| num % 7 == 0 || num % 11 == 0 }
# #   multiples.sum
# # end

# # def seven_eleven(number)
# #   (1...number).filter_map do |candidate|
# #     candidate if [7, 11].any? { |divisor| candidate % divisor == 0 }
# #   end.sum
# # end

# def seven_eleven(number)
#   ((7...number).step(7).to_a + (11...number).step(11).to_a).uniq.sum
# end

# p seven_eleven(10) == 7
# p seven_eleven(11) == 7
# p seven_eleven(12) == 18
# p seven_eleven(25) == 75
# p seven_eleven(100) == 1153
# p seven_eleven(0) == 0
# p seven_eleven(-100) == 0

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

# def pairs(numbers)
#   uniques = numbers.uniq
#   counts = uniques.map { |number| numbers.count(number) }
#   pair_count = counts.map { |count| count / 2 }
#   pair_count.sum
# end

# def pairs(numbers)
#   numbers.uniq.map { |number| numbers.count(number) / 2 }.sum
# end

# p pairs([3, 1, 4, 5, 9, 2, 6, 5, 3, 5, 8, 9, 7]) == 3
# p pairs([2, 7, 1, 8, 2, 8, 1, 8, 2, 8, 4]) == 4
# p pairs([]) == 0
# p pairs([23]) == 0
# p pairs([997, 997]) == 1
# p pairs([32, 32, 32]) == 1
# p pairs([7, 7, 7, 7, 7, 7, 7]) == 3

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

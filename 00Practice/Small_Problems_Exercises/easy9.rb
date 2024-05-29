### 11.3
=begin
Write a method that returns an Array that contains every other element of an Array that is passed in as an argument. The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

PROBLEM 2:59
input: array
  - can be empty

output: array
  - every other element from the input array, starting from 1st
  - if input array is empty, return empty array

EXAMPLES

DATA STRUCTURES
- needs
  - way to determine every other element

- input: array

- output: array

ALGORITHM
- consider each element of the input array
- add element to output array if its index is even
=end

# def oddities(array)
#   array.select.with_index { |_, index| index.even? }
# end

# def oddities(array)
#   (0...array.size).step(2).map { |index| array[index] }
# end

# def oddities(array)
#   array.partition.with_index { |_, index| index.odd? }.last
# end

# def oddities(array)
#   array.filter_map.with_index { |element, index| element if index.even? }
# end

def oddities(array)
  groups = array.group_by.with_index { |_, index| index.even? }
  groups[true] || []
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
p oddities([1, 2, 3, 4, 1]) == [1, 3, 1]

### 10.3
=begin
Write a method that takes one argument, a positive integer, and returns the sum of its digits.

PROBLEM 5:18
input: integer
  - positive

output: integer
  - sum of digits of input integer
=end
# def sum(number)
#   number.digits.sum
# end

# def sum(number)
#   number.to_s.chars.map(&:to_i).sum
# end

# def sum(number)
#   sum = 0
#   while number > 0
#     number, current_digit = number.divmod(10)
#     sum += current_digit
#   end
#   sum
# end

# p sum(23) #== 5
# p sum(496) #== 19
# p sum(123_456_789) #== 45

### 9.3
=begin
Given the array...
  words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
            'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
            'flow', 'neon']

Write a program that prints out groups of words that are anagrams. Anagrams are words that have the same exact letters in them but in a different order. Your output should look something like this:
  ["demo", "dome", "mode"]
  ["neon", "none"]
  #(etc)

PROBLEM 2:25
input: array
  - contains strings
  - all lowercase letters

output: arrays, printed to screen
  - each array is a group of words that are anagrams of each other
  - anagram = same exact letters but in a different order

EXAMPLES

DATA STRUCTURES
- needs:
  - determine which words are anagrams of each other
  - group anagrams together
  - print groups

- input: array
  - array of unique letter combos
- output: arrays / array of arrays

ALGORITHM
- create an array of unique letter combinations
  - transform input array
    - strings into arrays of individual characters
    - arrays sorted
    - only unique arrays kept
- for each unique letter combination, select strings in input array that have those letters
- print each array of strings
=end

# def anagram_groups(words)
#   groups = get_groups(words)
#   display_groups(groups)
# end

# def get_groups(words)
#   combos = words.map { |word| word.chars.sort }.uniq
#   combos.map do |combo|
#     words.select { |word| word.chars.sort == combo }.sort
#   end
# end

# def get_groups(words)
#   groups = words.group_by { |word| word.chars.sort }
#   groups.values.map(&:sort)
# end

# def display_groups(groups)
#   groups.each { |group| p group }
# end

# words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
#             'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
#             'flow', 'neon']

# anagram_groups(words)

### 8.3
=begin
Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.

PROBLEM 8:48
input: array
  - elements are subarrays
    - each subarray contains a string and an integer
      - string = fruit
      - integer = quantity

output: array
  - contains only strings
    - strings are fruits
    - each fruit appears quantity times

EXAMPLES

DATA STRUCTURES
- needs:
  - way to access each fruit / quantity subarray
  - way to create appropriate number of each fruit in output array

- input: array
  - transformed array
    - each subarray => fruit * quantity
    - flattened
- output: array

ALGORITHM
- transform the input array
  - for each element:
    - transform into an array of fruit * quantity
- flatten transformed array and return it
=end

# def buy_fruit(list)
#   list.flat_map { |fruit, quantity| [fruit] * quantity }
# end

# p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
#   ["apples", "apples", "apples", "orange", "bananas","bananas"]

### 7.3 GRADE BOOK
=begin
Write a method that determines the mean (average) of the three scores passed to it, and returns the letter value associated with that grade.
Numerical Score Letter 	Grade
90 <= score <= 100 	'A'
80 <= score < 90 	'B'
70 <= score < 80 	'C'
60 <= score < 70 	'D'
0 <= score < 60 	'F'

Tested values are all between 0 and 100. There is no need to check for negative values or values greater than 100.

PROBLEM 10:42
input: three integers
  - represent three scores
  - value will always be between 0 and 100, inclusive
output: string
  - represents letter grade
    - (90..100): 'A'
    - (80..89): 'B'
    - (70..79): 'C'
    - (60..69): 'D'
    - (0..59) 'F'

EXAMPLES

DATA STRUCTURES
- needs:
  - way to get average of 3 scores
  - way to translate score into letter grade

- input: three integers
  - sum of integers
  - average of integers
  - hash or case statement
- output: string

ALGORITHM
- create a hash to translate average scores to grades
  - keys are ranges
  - values are letters
- get grade average
  - add integers together
  - divide by 3
- consider each key-value pair in grades hash
  - if average is within range of key, return value

=end
# GRADE_RANGES = [(90..100), (80..89), (70..79), (60..69), (0..59)]
# GRADES = %w(A B C D F)
# GRADE_BOOK = GRADE_RANGES.zip(GRADES).to_h

# def get_grade(*scores)
#   average = scores.sum / scores.size
#   GRADE_BOOK.find { |range, _grade| range.include?(average) }.last
# end
###

# GRADE_CUTOFFS = (6..10).to_a.reverse
# GRADES = %w(A A B C D)
# GRADE_BOOK = GRADE_CUTOFFS.zip(GRADES).to_h

# def get_grade(*scores)
#   average = scores.sum / scores.size
#   GRADE_BOOK[average / 10] || 'F'
# end

# p get_grade(100, 100, 100)
# p get_grade(95, 90, 93)
# p get_grade(90, 90, 90)
# p get_grade(89, 89, 89)
# p get_grade(89, 85, 83)
# p get_grade(74, 78, 72)
# p get_grade(65, 66, 67)
# p get_grade(50, 50, 0)

### 6.3 SEQUENCE COUNT
=begin
Create a method that takes two integers as arguments. The first argument is a count, and the second is the first number of a sequence that your method will create. The method should return an Array that contains the same number of elements as the count argument, while the values of each element will be multiples of the starting number.

You may assume that the count argument will always have a value of 0 or greater, while the starting number can be any integer value. If the count is 0, an empty list should be returned.

PROBLEM 6:37
input: two integers
  - first: count
    - will always be >= 0
  - second: first number / multiple
    - can be any integer value

- output: array
  - size is first input integer
    - if input integer == 0, return empty array
  - elements are multiples of second input integer, beginning at second input integer

EXAMPLES

DATA STRUCTURES
- needs:
  - way to create sequence of multiples
  - way to control size of sequence / when to stop

- input: two integers
  - array to hold multiples
- output: array

ALGORITHM
- create a new array the size of the first input integer
- fill it with multiples of the second input integer and return it
  - multiply second input integer times index + 1
=end

# def sequence(size, multiple)
#   Array.new(size) { |index| multiple * (index + 1) }
#   size.times.map { |index| multiple * (index + 1) }
#   (1..size).map { |multiplier| multiple * multiplier }
# end

# def sequence(size, multiple)
#   return Array.new(size, multiple) if multiple == 0
#   multiple.step(by: multiple, to: multiple * size).to_a
# end

# def sequence(size, multiple)
#   return Array.new(size, multiple) if multiple == 0
#   Array((multiple..(multiple * size)).step(multiple))
# end

# def sequence(size, multiple)
#   Array.new(size, multiple).map.with_index { |num, index| num * (index + 1) }
# end

# def sequence(size, multiple)
#   case multiple <=> 0
#   when -1 then
#   when 0..1 then Array(1..(multiple * size))
#   end
# end

# p sequence(5, 1) #== [1, 2, 3, 4, 5]
# p sequence(5, 2) #== [2, 4, 6, 8, 10]
# p sequence(4, -7) #== [-7, -14, -21, -28]
# p sequence(3, 0) #== [0, 0, 0]
# p sequence(0, 1000000) #== []


### 5.3
=begin
Write a method that takes a first name, a space, and a last name passed as a single String argument, and returns a string that contains the last name, a comma, a space, and the first name.

PROBLEM 7:30
input: string
  - contains a first name followed by a space and a last name

output: string
  - contains the last name, a comma and a space, and the first name
  - case is maintained

EXAMPLES

DATA STRUCTURES
- needs:
  - way to access individual names from string
  - way to change order of names

- input: string
  - array of individual names
  - reversed array
- output: string

ALGORITHM
- create an array of the separate words in the input string
- reverse this array
- convert the array into a string, with a comma and space separating the names
=end

# def swap_name(string)
#   string.split.reverse.join(", ")
# end

# def swap_name(name)
#   names = name.split
#   "#{names.last}, #{names.first}"
# end

# def swap_name(name)
#   names = name.split
#   names.map.with_index { |name, index| names[index - 1] }.join(', ')
# end

# p swap_name('Joe Roberts') #== 'Roberts, Joe'

### 4.3 HOW LONG
=begin
Write a method that takes a string as an argument, and returns an Array that contains every word from the string, to which you have appended a space and the word length.

You may assume that words in the string are separated by exactly one space, and that any substring of non-space characters is a word.

PROBLEM 5:29
input: string
  - contains words
    - words are separated by exactly one space
    - any substring of non-space characters
  - can be empty

output: array
  - contains every word from input string in order as a separate element
  - each element
    - word from string
    - plus a space and the word length
  - number of elements == number of words in input string
  - if input string is empty, return empty array

EXAMPLES

DATA STRUCTURES
- needs:
  - way to separate string into individual words
  - way to determine length of each word
  - way to append length to each word

- input: string
  - array of individual words
  - transformed array: add word length
- output: array

ALGORITHM
- create an array of individual words from the input string
- transform this array
  - each element is the original word + the word length
- return the transformed array
=end

# def word_lengths(string)
#   string.split.map { |word| "#{word} #{word.size}" }
# end

# def word_lengths(string)
#   words = string.split
#   sizes = string.split.map { |word| " #{word.size}"}
#   words.zip(sizes).map(&:join)
# end

# p word_lengths("cow sheep chicken") #== ["cow 3", "sheep 5", "chicken 7"]
# p word_lengths("baseball hot dogs and apple pie") == ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]
# p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]
# p word_lengths("Supercalifragilisticexpialidocious") == ["Supercalifragilisticexpialidocious 34"]
# p word_lengths("") == []

### 3.3 COUNTING UP
=begin
Write a method that takes an integer argument, and returns an Array of all integers, in sequence, between 1 and the argument.

You may assume that the argument will always be a valid integer that is greater than 0.

PROBLEM 5:00
input: integer
  - always valid
  - always greater than 0

output: array
  - elements are all integers
  - from 1 up to input integer, inclusive, in sequence
  - number of elements == input integer

EXAMPLES

DATA STRUCTURES
- needs
  - way to produce successive numbers
  - way to control number of elements in output array

- input: integer
  - range: from 1 up to input integer
  - transformed array
- output: array

ALGORITHM
- create a range from 1 up to the input integer
- transform range into an array and return it
=end

# def sequence(last_number)
#   (1..last_number).map(&:itself)
# end

# def sequence(last_number)
#   (1..last_number).to_a
# end

# def sequence(last_number)
#   Array.new(last_number.abs) { |index| index.next }
# end

# def sequence(last_number)
#   last_number.times.map(&:next)
# end

# def sequence(integer)
#   integer > 0 ? (1..integer).to_a : (integer..1).to_a.reverse
# end

# def sequence(int)
#   sign = int <=> 0
#   ([int, 1].min..[sign, int].max).to_a
# end

# p sequence(-5) #== [1, 2, 3, 4, 5]
# p sequence(3) == [1, 2, 3]
# p sequence(1) == [1]

### 2.3 DOUBLE DOUBLES
=begin
A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits. For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

Write a method that returns 2 times the number provided as an argument, unless the argument is a double number; double numbers should be returned as-is.

PROBLEM 9:35
input: integer

output: integer
  - input integer if input integer is a "double number"
    - double number:
      - even number of digits
      - left side digits == right side digits
  - twice the input integer otherwise

EXAMPLES

DATA STRUCTURES
- needs
  - way to determine if input integer is a double number
    - way to determine number of digits
      - even or odd?
    - way to compare front and back half

- input: integer
  - integer converted to string (to get length)
  - front and back half of integer string (to compare)
- output: integer

ALGORITHM
- determine if input integer is a double number
  - convert input integer into a string
  - if length is odd
    - not a double number
  - if length is even
    - compare first half to last half
      - if they are the same, double number
      - otherwise not a double number
- return input integer if so
- double input integer and return it if not
=end

# def twice(number)
#   double_number?(number) ? number : number * 2
# end

# def double_number?(number)
#   number.to_s.size.even? ? sides_equal?(number) : false
# end

# def sides_equal?(number)
#   characters = number.to_s.chars
#   half = characters.size / 2
#   characters.take(half) == characters.drop(half)
# end

# def double_number?(number)
#   characters = number.to_s.chars
#   half = characters.size / 2
#   characters.take(half) == characters.drop(half)
# end

# p twice(37) == 74
# p twice(44) == 44
# p twice(334433) == 668866
# p twice(444) == 888
# p twice(107) == 214
# p twice(103103) == 103103
# p twice(3333) == 3333
# p twice(7676) == 7676
# p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
# p twice(5) == 10

### 1.3 HOWDY
=begin
Create a method that takes 2 arguments, an array and a hash. The array will contain 2 or more elements that, when combined with adjoining spaces, will produce a person's name. The hash will contain two keys, :title and :occupation, and the appropriate values. Your method should return a greeting that uses the person's full name, and mentions the person's title and occupation.

PROBLEM 3:42
input: array, hash
  - array:
    - contains 2 or more elements
    - when combined (with spaces) produce a name
      - don't add puncuation (e.g. 'Q' not 'Q.')
  - hash:
    - two key-value pairs
      - keys: :title, :occupation
      - values: strings

output: string printed to terminal
  - "Hello, &NAME! Nice to have a $TITLE $OCCUPATION around."

EXAMPLES

DATA STRUCTURES
- needs:
  - way to combine array strings into name
  - way to access title and occupation
    - way to pick correct article ('a', 'an')

- input: array, hash
  - array elements converted into a string: full name
  - hash pairs converted into a string: title and occupation
- output: string to print to screen

ALGORITHM
- combine array strings into a single string
  - separated by spaces
- combine hash values into a single string
  - separated by spaces
- determine proper article
  - use first character of title-occupation string
    - a / an
- print string to screen
=end

# def greetings(names, job_info)
#   name, job = [names, job_info.values].map { |info| info.join(' ')}
#   article = 'aeiou'.include?(job[0].downcase) ? 'an' : 'a'
#   "Hello, #{name}! Nice to have #{article} #{job} around."
# end


# p greetings(['John', 'Q', 'Doe'], { title: 'Advanced', occupation: 'Plumber' })
# => "Hello, John Q Doe! Nice to have a Master Plumber around."

### 11.2 ODD LISTS
# def oddities(array)
#   array.filter_map.with_index { |element, index| element if index.even? }
# end

# def oddities(array)
#   array.select.with_index { |_, index| index.even? }
# end

# p oddities([2, 3, 4, 5, 6]) #== [2, 4, 6]
# p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
# p oddities(['abc', 'def']) == ['abc']
# p oddities([123]) == [123]
# p oddities([]) == []
# p oddities([1, 2, 3, 4, 1]) == [1, 3, 1]

### 10.2 SUM OF DIGITS
# def sum_of_digits(number)
#   number.digits.sum
# end

# def sum_of_digits(num)
#   Array.new(num.to_s.size).map do
#     num, remainder = num.divmod(10)
#     remainder
#   end.sum
# end

# p sum_of_digits(23) #== 5
# p sum_of_digits(496) #== 19
# p sum_of_digits(123_456_789) #== 45

### 9.2 GROUP ANAGRAMS
# def anagrams(list)
#   anagrams = get_anagrams(list)
#   display_anagrams(anagrams)
# end

# def get_anagrams(list)
#   anagram_list = list.map { |word| word.chars.sort.join }.uniq
#   anagram_list.map do |anagram|
#     list.select { |word| word.chars.sort.join == anagram }
#   end
# end

# def display_anagrams(anagrams)
#   anagrams.each { |array| p array }
# end

# words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
#   'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
#   'flow', 'neon']

# anagrams(words)


###
# def anagrams(list)
#   anagrams = get_anagrams(list)
#   display_anagrams(anagrams)
# end

# def get_anagrams(list)
#   list.map do |word1|
#     list.select { |word2| word1.chars.sort == word2.chars.sort }
#   end.uniq
# end

# def display_anagrams(anagrams)
#   anagrams.each { |array| p array }
# end
# ###

# ###
# def anagrams(list)
#   anagrams = get_anagrams(list)
#   display_anagrams(anagrams)
# end

# def get_anagrams(list)
#   list.group_by { |word| word.chars.sort.join }
# end

# def display_anagrams(anagrams)
#   anagrams.each_value { |group| p group }
# end

# words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
#   'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
#   'flow', 'neon']

# anagrams(words)

### 8.2 GROCERY LIST
# def buy_fruit(list)
#   list.each_with_object([]) do |(type, amount), output|
#     amount.times { output << type }
#   end
# end

# def buy_fruit(list)
#   types = list.to_h.keys
#   amounts = list.to_h.values
#   amounts.flat_map.with_index { |amount, index| [types[index]] * amount }
# end

# def buy_fruit(list)
#   list.flat_map { |type, amount| [type] * amount }
# end

# p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) #==
# ["apples", "apples", "apples", "orange", "bananas","bananas"]

### 7.2 GRADE BOOK
###
# def get_grade(score1, score2, score3)
#   average = (score1 + score2 + score3) / 3
#   case average
#   when (90..100) then 'A'
#   when (80..89)  then 'B'
#   when (70..79)  then 'C'
#   when (60..69)  then 'D'
#   when (0..59)   then 'F'
#   end
# end
###

###
# GRADE_SCALE = {
#   A: (90..),
#   B: (80..89),
#   C: (70..79),
#   D: (60..69),
#   F: (0..59)
# }

# def get_grade(*grades)
#   GRADE_SCALE.select do |grade, range|
#     range.cover?(grades.sum / grades.size)
#   end.keys.first.to_s
# end
###

# GRADE_SCALE = {
#   (90..)   => 'A',
#   (80..89) => 'B',
#   (70..79) => 'C',
#   (60..69) => 'D',
#   (0..59)  => 'F'
# }

# def get_grade(*grades)
#   average = grades.sum / grades.size
#   GRADE_SCALE.filter_map { |range, grade| grade if range.cover?(average) }.last
# end

# p get_grade(95, 90, 93) == "A"
# p get_grade(50, 50, 95) == "D"

### 6.2 SEQUENCE COUNT
### Daniel Chae
# def sequence(n, x)
#   x.step((n * x == 0 ? (return [x] * n) : n * x), x).to_a
# end
###

# def sequence(count, start)
#   start == 0 ? [0] * count : start.step(start * count, start).to_a
# end

# def sequence(count, start)
#   return [0] * count if start == 0
#   start.step(start * count, start).to_a
# end

# def sequence(count, multiple)
#   ([multiple] * count).map.with_index do |element, index|
#     element * (index + 1)
#   end
# end
# ##

# def sequence(count, start)
#   multiple, adjustment = start == 0 ? [1, count] : [start, 1]
#   start.step(start * count, multiple).to_a * adjustment
# end

# def sequence(count, start)
#   multiple = start == 0 ? 1 : start
#   adjustment = start == 0 ? count : 1
#   start.step(start * count, multiple).to_a * adjustment
# end

# def sequence(count, start)
#   (1..count).map { |multiplier| start * multiplier }
# end

# def sequence(count, start)
#   1.upto(count).map { |multiplier| start * multiplier }
# end

# def sequence(count, start)
#   count.times.map { |multiplier| start + (start * multiplier) }
# end

# def sequence(count, start)
#   count.times.map { |multiplier| start * (multiplier + 1) }
# end

# def sequence(count, start)
#   Array.new(count) { |index| start * (index + 1) }
# end

# def sequence(count, start)
#   Array.new(count) { |index| start + (index * start) }
# end

# p sequence(5, 1) #== [1, 2, 3, 4, 5]
# p sequence(4, -7) #== [-7, -14, -21, -28]
# p sequence(3, 0) #== [0, 0, 0]
# p sequence(0, 1000000) == []

### 5.2 NAME SWAPPING
# def swap_name(names)
#   names.split.reverse.join(', ')
# end

# p swap_name('Joe Roberts') == 'Roberts, Joe'

### 4.2 HOW LONG ARE YOU?
# def word_lengths(words)
#   words.split.map { |word| "#{word} #{word.size}" }
# end

# ###
# def word_lengths(words)
#   # stripped = words.strip.squeeze(' ')
#   words_array = split_string(words)
#   words_array.map { |word| "#{word} #{word.size}" }
# end

# def split_string(string)
#   return [] if string.empty?
#   spaces = get_spaces(string)
#   get_words(string, spaces)
# end

# def get_spaces(string)
#   string.chars.each_index.select { |index| string[index] == ' ' }
# end

# def get_words(string, spaces)
#   starts, stops = get_starts_and_stops(string, spaces)
#   starts.map.with_index { |start, index| string[start...stops[index]] }
# end

# def get_starts_and_stops(string, spaces)
#   starts = spaces.map { |index| index + 1 }.prepend(0)
#   stops = spaces << string.length
#   [starts, stops]
# end
# ###
# p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]
# p word_lengths("baseball hot dogs and apple pie") == ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]
# p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]
# p word_lengths("Supercalifragilisticexpialidocious") == ["Supercalifragilisticexpialidocious 34"]
# p word_lengths("") == []

### 3.2 COUNTING UP
# def sequence(number)
#   (1..number).to_a
# end

# def sequence(number)
#   1.upto(number).to_a
# end

# def sequence(number)
#   current_num = 1
#   result = []
#   loop do
#     result << current_num
#     current_num += 1
#     break if current_num > number
#   end
#   result
# end

# p sequence(5) == [1, 2, 3, 4, 5]
# p sequence(3) == [1, 2, 3]
# p sequence(1) == [1]

### 2.2 DOUBLE DOUBLES
# def twice(number)
#   double_number?(number) ? number : number * 2
# end

# def double_number?(number)
#   digits = number.digits
#   half = digits.size / 2
#   digits[0...half] == digits[half..-1]
# end

# def double_number?(number)
#   string = number.to_s
#   half = string.size / 2
#   string[0...half] == string[half..-1]
# end

# def double_number?(number)
#   digits = number.digits
#   half = digits.size / 2
#   digits.take(half) == digits.drop(half)
# end

# p twice(37) == 74
# p twice(44) == 44
# p twice(334433) == 668866
# p twice(444) == 888
# p twice(107) == 214
# p twice(103103) == 103103
# p twice(3333) == 3333
# p twice(7676) == 7676
# p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
# p twice(5) == 10

### 1.2 WELCOME STRANGER
# def greetings(names_array, job_hash)
#   name, job = [names_array, job_hash.values].map { |array| array.join(' ') }
#   "Hello, #{name}! Nice to have a #{job} around."
# end

# p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => "Hello, John Q Doe! Nice to have a Master Plumber around."

### 11 ODD LISTS
# def oddities(array)
#   array.select.with_index { |_, idx| idx.even? }
# end

# def oddities(array)
#   array.each_with_index.with_object([]) do |(ele, idx), result|
#     result << ele if idx.even?
#   end
# end

# def oddities(array)
#   array.each_index.with_object([]) do |idx, result|
#     result << array[idx] if idx.even?
#   end
# end

# def oddities(array)
#   array.map.with_index { |ele, idx| ele if idx.even? }.compact
# end

# def oddities(array)
#   (0...array.size).map { |idx| array[idx] if idx.even? }.compact
# end

# def oddities(array)
#   (0...array.size).step(2).map { |idx| array[idx] }
# end

# def oddities(array)
#   0.step(array.size - 1, 2).map { |idx| array[idx] }
# end

# p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
# p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
# p oddities(['abc', 'def']) == ['abc']
# p oddities([123]) == [123]
# p oddities([]) == []
# p oddities([1, 2, 3, 4, 1]) == [1, 3, 1]
# p oddities([1, 1, 1, 1, 1]) == [1, 1, 1]
# p oddities([0, 1, 1, 1, 1]) == [0, 1, 1]

### 10 SUM OF DIGITS
# def sum(num)
#   num.to_s.chars.map(&:to_i).sum
# end

# def sum(num)
#   num.to_s.each_char.map(&:to_i).sum
# end

# def sum(num)
#   num.digits.sum
# end

# def sum(num)
#   string = num.to_s
#   sum = 0
#   (0...string.size).each { |idx| sum += string[idx].to_i }
#   sum
# end

# def sum(num)
#   string = num.to_s
#   sum = 0
#   string.size.times { |idx| sum += string[idx].to_i }
#   sum
# end

# def sum(num)
#   string = num.to_s
#   (0...string.size).each.inject(0) { |sum, idx| sum += string[idx].to_i }
# end

# def sum(num)
#   string = num.to_s
#   string.size.times.inject(0) { |sum, idx| sum += string[idx].to_i }
# end

# def sum(num)
#   string = num.to_s
#   string.size.times.with_object([]) do |_, result|
#     num, remainder = num.divmod(10)
#     result << remainder
#   end.sum
# end

# def sum(num)
#   num.to_s.size.times.map do |_|
#     num, remainder = num.divmod(10)
#     remainder
#   end.sum
# end

# p sum(23) #== 5
# p sum(496) #== 19
# p sum(123_456_789) #== 45

### 9 GROUP ANAGRAMS
# words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
#   'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
#   'flow', 'neon']

#########################
# initial solution #1
# def find_all_anagrams(list)
#   list.each_with_object([]) do |word, all_anagrams|
#     next if all_anagrams.flatten.include?(word)
#     sub_anagrams = find_sub_anagrams(list, word)
#     all_anagrams << sub_anagrams unless sub_anagrams.empty?
#   end
# end

# def find_sub_anagrams(list, word1)
#   sublist = list - [word1]
#   sub_anagrams = sublist.each_with_object([]) do |word2, sub_anagrams|
#     sub_anagrams << word2 if is_anagram?(word1, word2)
#   end
#   sub_anagrams.prepend(word1) unless sub_anagrams.empty?
# end

# def is_anagram?(word1, word2)
#   word1.chars.sort == word2.chars.sort
# end

# def display_anagrams(anagrams)
#   anagrams.each { |subarray| p subarray }
# end

# anagrams = find_all_anagrams(words)
# display_anagrams(anagrams)

#########################
# initial solution #2
# def find_all_anagrams(list)
#   list.each_with_index.with_object([]) do |(word1, idx), all_anagrams|
#     next if all_anagrams.flatten.include?(word1)
#     sub_anagrams = find_sub_anagrams(word1, idx, list)
#     all_anagrams << sub_anagrams unless sub_anagrams.empty?
#   end
# end

# def find_sub_anagrams(word1, idx, list)
#   sub_anagrams = ((idx + 1)...list.size).each_with_object([]) do |idx2, sub_anagrams|
#     sub_anagrams << list[idx2] if is_anagram?(word1, list[idx2])
#   end
#   sub_anagrams.prepend(word1) unless sub_anagrams.empty?
# end

# def is_anagram?(word1, word2)
#   word1.chars.sort == word2.chars.sort
# end

# def display_anagrams(anagrams)
#   anagrams.each { |subarray| p subarray }
# end

# anagrams = find_all_anagrams(words)
# display_anagrams(anagrams)

#########################
# using Enumerable#chunk
# def find_anagrams(list)
#   sorted_list = list.sort_by { |word| word.chars.sort.join }
#   sorted_list.chunk do |word|
#     word.chars.sort.join
#   end.map { |element| element[1] }
# end

# using Enumerable#chunk_while
# def find_anagrams(list)
#   sorted_list = list.sort_by { |word| word.chars.sort.join }
#   sorted_list.chunk_while do |word1, word2|
#     word1.chars.sort.join == word2.chars.sort.join
#   end
# end

# def display_anagrams(anagrams)
#   anagrams.each { |group| p group }
# end

# anagrams = find_anagrams(words)
# display_anagrams(anagrams)

#########################
# LS Solution refactored
# def find_anagrams(list)
#   list.each_with_object({}) do |word, result|
#     group = word.chars.sort.join
#     result.has_key?(group) ? result[group] << word : result[group] = [word]
#   end
# end

# def display_anagrams(anagrams)
#   anagrams.each_value { |value| p value }
# end

# anagrams = find_anagrams(words)
# display_anagrams(anagrams)

#########################
# using Enumerable#group_by
# def find_anagrams(list)
#   list.group_by { |word| word.chars.sort.join }
# end

# def display_anagrams(anagrams)
#   anagrams.each_value { |group| p group }
# end

# anagrams = find_anagrams(words)
# display_anagrams(anagrams)

#########################
# using Array#select #1
# def find_anagrams(list)
#   list.map do |word1|
#     list.select { |word2| word2.chars.sort == word1.chars.sort }.sort
#   end.uniq
# end

# using Array#select #2
# def find_anagrams(list)
#   groups = list.map { |word| word.chars.sort.join }.uniq
#   groups.map do |group|
#     list.select { |word| word.chars.sort.join == group }
#   end
# end

# def display_anagrams(anagrams)
#   anagrams.each { |group| p group }
# end

# anagrams = find_anagrams(words)
# display_anagrams(anagrams)

#########################

### 8 GROCERY LIST
# def buy_fruit(list)
#   list.each_with_object([]) do |(item, quantity), results|
#     quantity.times { results << item }
#   end
# end

# def buy_fruit(list)
#   list.map { |item, quantity| [item] * quantity }.flatten
# end

# def buy_fruit(list)
#   list.flat_map { |item, quantity| [item] * quantity }
# end

# p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) #==
# ["apples", "apples", "apples", "orange", "bananas","bananas"]

### 7 GRADE BOOK
# def get_grade(score1, score2, score3)
#   average = (score1 + score2 + score3) / 3
#   case average
#   when   (90..) then 'A'
#   when (80..89) then 'B'
#   when (70..79) then 'C'
#   when (60..69) then 'D'
#   else               'F'
#   end
# end

#########
# GRADES = {  A: (90..),
#             B: (80..89),
#             C: (70..79),
#             D: (60..69),
#             F: (0..59) }

# def get_grade(num1, num2, num3)
#   average = (num1 + num2 + num3) / 3
#   GRADES.keys.each { |grade| return grade.to_s if GRADES[grade].include?(average) }
# end
#############
# def get_grade(*grades)
#   grade_scale = {
#     A:   (90..),
#     B: (80..89),
#     C: (70..79),
#     D: (60..69),
#     F:  (0..59)
#   }
#   average = grades.sum / grades.size
#   grade_scale.keys.each do |letter|
#     return letter.to_s if (grade_scale[letter]).include?(average)
#   end
# end
###########
# GRADE_SCALE = { A: (90..),
#                 B: (80..89),
#                 C: (70..79),
#                 D: (60..69),
#                 F: (0..59) }
# # def get_grade(*scores)
# #   GRADE_SCALE.find do |grade, range|
# #     range.include?(scores.sum / scores.size)
# #   end.first.to_s
# # end

# def get_grade(*scores)
#   average = (scores.sum / scores.size.to_f).round
#   GRADE_SCALE.each do |grade, range|
#     return grade.to_s if range.include?(average)
#   end
# end
# # ############/
# p get_grade(60, 60, 59)
# p get_grade(95, 90, 93) == "A"
# p get_grade(50, 50, 95) == "D"

### 6 SEQUENCE COUNT
# def sequence(count, num)
#   (1..count).map { |multiplier| num * multiplier }
# end

# def sequence(count, first)
#   count.times.each_with_object([]) do |idx, result|
#     result[idx] = first + (idx * first)
#   end
# end

# def sequence(count, num)
#   count.times.map { |idx| num + (idx * num) }
# end

# def sequence(count, first)
#   first.step(by: first).take(count)
# end

# one-liner with step for fun (Daniel Chae) VVVVV
# def sequence(n, x)
#   x.step((n * x == 0 ? (return [x] * n) : n * x), x).to_a
# end

# def sequence(count, first)
#   limit = count * first == 0 ? (return [first] * count) : count * first
#   first.step(limit, first).to_a
# end
# one-liner with step for fun (Daniel Chae) ^^^^

# p sequence(5, 1) #== [1, 2, 3, 4, 5]
# p sequence(4, -7) #== [-7, -14, -21, -28]
# p sequence(3, 0) #== [0, 0, 0]
# p sequence(0, 1000000) #== []

### 5 NAME SWAPPING
# def swap_name(name)
#   name.split.reverse.join(", ")
# end

# def swap_name(name)
#   "#{name.split[1]}, #{name.split[0]}"
# end

# def swap_name(full_name)
#   name_array = full_name.split.reverse
#   name_array.each_index.with_object("") do |idx, swapped_name|
#     swapped_name << name_array[idx]
#     swapped_name << ", " if idx == 0
#   end
# end

# p swap_name('Joe Roberts') == 'Roberts, Joe'

### 4 HOW LONG ARE YOU?
# def word_lengths(string)
#   string.split.map { |word| "#{word} #{word.size}" }
# end

###############
# def word_lengths(string)
#   words = get_words(string)
#   words.map { |word| "#{word} #{word.size}" }
# end

# def get_words(string)
#   spaces = find_spaces(string)
#   spaces += [string.size] unless string.empty?
#   start = 0
#   spaces.each_index.with_object([]) do |idx, result|
#     stop = spaces[idx]
#     result << string[start...stop]
#     start = stop + 1
#   end
# end

# def find_spaces(string)
#   string.chars.each_with_index.with_object([]) do |(char, idx), spaces|
#     spaces << idx if char == ' '
#   end
# end
####################

# p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]
# p word_lengths("baseball hot dogs and apple pie") == ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]
# p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]
# p word_lengths("Supercalifragilisticexpialidocious") == ["Supercalifragilisticexpialidocious 34"]
# p word_lengths("") == []

### 3 COUNTING UP
# def sequence(num)
#   (1..num).to_a
# end

# def sequence(num)
#   1.upto(num).to_a
# end

# def sequence(num)
#   num > 0 ? (1..num).to_a : (num..-1).to_a
# end

# def sequence(num)
#   return [0] if num == 0
#   num.positive? ? 1.upto(num).to_a : -1.downto(num).to_a
# end

# p sequence(5) == [1, 2, 3, 4, 5]
# p sequence(3) == [1, 2, 3]
# p sequence(1) == [1]
# p sequence(0) == []
# p sequence(-1) == [-1]
# p sequence(-5) == [-5, -4, -3, -2, -1]

### 2 DOUBLE DOUBLES
# def twice(num)
#   str = num.to_s
#   half = str.size / 2
#   str[...half] == str[half..] ? num : num * 2
# end

# def twice(num)
#   array = num.to_s.chars
#   half = array.size / 2
#   array.take(half) == array.drop(half) ? num : num * 2
# end

# def twice(num) # by Shawn Grycki
#   array = num.to_s.chars
#   half = array.size / 2
#   array1, array2 = array.partition.with_index { |_, idx| idx < array.length / 2 }
#   array1 == array2 ? num : num * 2
# end

# def twice(num)
#   array = num.to_s.chars
#   half = (array.size / 2.0).ceil
#   half.times.all? { |idx| array[idx] == array[idx + half] } ? num : num * 2
# end

# p twice(37) == 74
# p twice(44) == 44
# p twice(334433) == 668866
# p twice(444) == 888
# p twice(107) == 214
# p twice(103103) == 103103
# p twice(3333) == 3333
# p twice(7676) == 7676
# p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
# p twice(5) == 10

### 1 WELCOME STRANGER
# def greetings(name, info)
#   "Hello, #{name.join(' ')}! " +
#   "Nice to have a #{info.values.join(' ')} around."
# end

# p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
#=> "Hello, John Q Doe! Nice to have a Master Plumber around."

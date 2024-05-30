### 3.2 ROTATION III
=begin
If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.

Write a method that takes an integer as argument, and returns the maximum rotation of that argument. You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

Note that you do not have to handle multiple 0s.

PROBLEM 1:26
input: integer
  - does not contain multiple zeros in a row
  - can be length 1

output: integer
  - digits have been maximally rotated
  - if input integer has only one digit, output integer is the same
  - if final number has leading zero, it is dropped

EXAMPLES

DATA STRUCTURES
- needs:
  - way to track number of iterations
  - way to select correct number of rightmost digits on each iteration

- input: integer
  - array of individual digits
  - subarrays of decreasing size to perform rotation on
    - size number length down to size 2
      -  735291 => 352917
      - 3 52917 => 329175
      - 32 9175 => 321759
      - 321 759 => 321597
      - 3215 97 => 321579
- output: integer

ALGORITHM
- create an array of individual digits from input integer
- 0 up to (array length - 2): start index
  - on each iteration rotate the digits from that start index to the end of the array
=end


p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

### 2.2 ROTATION II
=begin
Write a method that can rotate the last n digits of a number.
Note that rotating just 1 digit results in the original number being returned.
You may use the rotate_array method from the previous exercise if you want. (Recommended!)
You may assume that n is always a positive integer.

PROBLEM 8:27
input: two integers
  - first: number to be rotated
  - second: n, number of rightmost digits to be rotated
    - always positive

output: integer
  - has n rightmost digits rotated
    - rotated = first digit is moved to last position, all other digits shifted forward
      - 123 => 231
  - remaining digits unchanged
  - if n == 1, return original number

EXAMPLES

DATA STRUCTURES
- needs:
  - way to isolate n rightmost digits
  - way to rotate digits
  - way to recombine into result

- input: 2 integers
  - array of individual digits of first input integer
  - two arrays: leftmost digits and rightmost digits
  - rotated rightmost digits
  - combined arrays => string => integer
- output: integer

ALGORITHM
- set a variable to 1 or -1 depending on if first input integer is positive or negative
- convert absolute value of first input integer into an array of individual digits (in reverse order)
- create an array of the first n digits
- create an array of the remaining digits
- reverse both arrays
- rotate rightmost digits
- combine both arrays into one
- convert to a string, then an integer
- multiply by sign variable and return
=end

# def rotate_rightmost_digits(number, digits_to_rotate)
#   return number if digits_to_rotate > number.to_s.size
#   sign = number.positive? ? 1 : -1
#   leftmost, rightmost = separate_digits(number.abs, digits_to_rotate)
#   (leftmost + rotate_array(rightmost)).join.to_i * sign
# end

# def separate_digits(number, digits_to_rotate)
#   leftmost = number.digits.drop(digits_to_rotate).reverse
#   rightmost = number.digits.take(digits_to_rotate).reverse
#   [leftmost, rightmost]
# end

# def rotate_array(array)
#   array.empty? ? array : array[1..-1] + array[0, 1]
# end

# p rotate_rightmost_digits(735291, 1) == 735291
# p rotate_rightmost_digits(735291, 2) == 735219
# p rotate_rightmost_digits(735291, 3) == 735912
# p rotate_rightmost_digits(735291, 4) == 732915
# p rotate_rightmost_digits(735291, 5) == 752913
# p rotate_rightmost_digits(735291, 6) == 352917
# p rotate_rightmost_digits(-735291, 3) == -735912
# p rotate_rightmost_digits(735291, 8) == 735291
# p rotate_rightmost_digits(1, 3)

### 1.2 ROTATION I
=begin
Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

Do not use the method Array#rotate or Array#rotate! for your implementation.

PROBLEM 3:23
input: array
  - may contain only one element

output: new array
  - first element of input array is now in last position
  - if input array has only one element, new array will have the same value

EXAMPLES

DATA STRUCTURES
- needs:
  - way to access each element
  - way to shift position of each element
  - way to avoid mutating input array

- input: array
  - array of all but first element
- output: array

ALGORITHM
- create a new array of all element from input array except first element
- add first element to the end of the new array
- return the new array
=end

# def rotate_array(array)
#   array[1..-1] + [array[0]]
# end

# def rotate_string(string)
#   rotate_array(string.chars).join
# end

# def rotate_integer(integer)
#   rotate_array(integer.digits.reverse).join.to_i
# end

# p rotate_integer(12345)

# def rotate_object(object)
#   case object
#   when Array, String
#     object.empty? ? object : object[1..-1] + object[0, 1]
#   when Hash
#     rotate_object(object.to_a).to_h
#   when Integer
#     sign = object.positive? ? 1 : -1
#     sign * rotate_object(object.abs.to_s).to_i
#   else
#     "Unable to rotate this type of object."
#   end
# end

# Tests
# array = [1, 2, 3]
# p rotate_object([]) == []
# p rotate_object(array) == [2, 3, 1]
# p array == [1, 2, 3]
# puts
# string = '123'
# p rotate_object('') == ''
# p rotate_object(string) == '231'
# p string == '123'
# puts
# hash = {a: 1, b: 2, c: 3}
# p rotate_object({}) == {}
# p rotate_object(hash) == {b: 2, c: 3, a: 1}
# p hash == {a: 1, b: 2, c: 3}
# puts
# integer = 123
# p rotate_object(0) == 0
# p rotate_object(integer) == 231
# p integer == 123
# puts
# p rotate_object(-123) # => -231
# p rotate_object(102) # => 21
# p rotate_object(1.2) # => "Unable to rotate this type of object."

# p rotate_array([7, 3, 5, 2, 9, 1]) #== [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']

# x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# p x == [1, 2, 3, 4]                 # => true

### 10 FIBONACCI III
=begin
Write a method that returns the last digit of the nth Fibonacci number.
=end

# def fibonacci_last(number)
#   first, last = [1, 1]
#   3.upto(number) do
#     first, last = [last, (first + last) % 10]
#   end
#   last
# end

# p fibonacci_last(15) == 0
# p fibonacci_last(20) == 5
# p fibonacci_last(100) == 5
# p fibonacci_last(100_001) == 1
# p fibonacci_last(1_000_007) == 3
# p fibonacci_last(123456789) == 4


### 9 FIBONACCI II
=begin
Rewrite your recursive fibonacci method so that it computes its results without recursion.

PROBLEM
input: integer
  - positive
  - represents place in Fibonacci sequence
- output: integer
  - represents number at that place in Fibonacci sequence
  - sum of previous two integers in sequence
    - first two integers in sequence are 1
      - 1, 1, 2, 3, 5 . . .

EXAMPLES

DATA STRUCTURES
- input: integer
  - array of current 'last two' integers
    - [1, 1]
  - updated array: first number becomes second, second becomes (first + second)

- output: integer

ALGORITHM
- create an array to hold the current two numbers
  - set its value to [1, 1]
- create a range from 3 up to input integer
- for each number in the range:
  - set first array element to equal second array element
  - set second array element to equal sum of first and second elements
- once finished, return the last number in the array
=end

# def fibonacci(number)
#   first, last = [1, 1]
#   3.upto(number) { first, last = [last, first + last] }
#   last
# end

# p fibonacci(1) == 1
# p fibonacci(2) == 1
# p fibonacci(3) == 2
# p fibonacci(4) == 3
# p fibonacci(5) == 5
# p fibonacci(12) == 144
# p fibonacci(20) == 6765
# p fibonacci(100) == 354224848179261915075
# p fibonacci(100_001) # => 4202692702.....8285979669707537501

### 8.2 FIBONACCI I
=begin
The Fibonacci series is a sequence of numbers starting with 1 and 1 where each number is the sum of the two previous numbers: the 3rd Fibonacci number is 1 + 1 = 2, the 4th is 1 + 2 = 3, the 5th is 2 + 3 = 5, and so on. In mathematical terms:

F(1) = 1
F(2) = 1
F(n) = F(n - 1) + F(n - 2) where n > 2

Sequences like this translate naturally as "recursive" methods. A recursive method is one in which the method calls itself.

Recursive methods have three primary qualities:

    They call themselves at least once.
    They have a condition that stops the recursion (n == 1 above).
    They use the result returned by themselves.

Write a recursive method that computes the nth Fibonacci number, where nth is an argument to the method.

PROBLEM
input: integer
  - positive
  - represents place in the Fibonacci sequence
output: integer
  - represents Fibonacci number at that place (input integer) in the sequence

EXAMPLES
1, 1, 2, 3, 5

DATA STRUCTURES

ALGORITHM

=end

# def fibonacci(number)
#   number <= 2 ? 1 : fibonacci(number - 1) + fibonacci(number - 2)
# end

# p fibonacci(1) == 1
# p fibonacci(2) == 1
# p fibonacci(3) == 2
# p fibonacci(4) == 3
# p fibonacci(5) == 5
# p fibonacci(12) == 144
# p fibonacci(20) == 6765



### 7.2 WORD TO DIGIT
=begin
Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

Example:
word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

12:37
PROBLEM
input: string
  - may contain 'number words', e.g. 'five', 'three', etc
output: string
  - same as input string except:
    - 'number words' are converted to number characters: 'five' -> '5'

EXAMPLES

DATA STRUCTURES
- input: string
  - hash: keys are 'number words' and values are number characters: 'zero' => '0'
  - array of individual words in string
  - transformed array
- output: string

ALGORITHM
- create a hash to convert number words to number characters
  - keys are number words
  - values are number characters
- convert input string into an array of individual words
  - remove punctuation
- transform this array
  - all words stay the same except number words
    - these are changed into number characters using the hash
- convert transformed array into a string, and return it
=end

# number_words = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
# number_characters = ('0'..'9').to_a
# WORDS_TO_CHARACTERS = number_words.zip(number_characters).to_h
# ALPHA_CHARACTERS = ('A'..'Z').to_a + ('a'..'z').to_a

# def word_to_digit(string)
#   words = string.split
#   words.map do |word|
#     letters = letters_only(word)
#     if WORDS_TO_CHARACTERS.include?(letters)
#       deal_with_punctuation(word, letters)
#     else
#       word
#     end
#   end.join(' ')
# end

# def letters_only(word)
#   word.chars.select { |char| ALPHA_CHARACTERS.include?(char) }.join
# end

# def deal_with_punctuation(word, letters)
#   difference = (word.chars - letters.chars).join
#   WORDS_TO_CHARACTERS[letters] + difference
# end

# p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'



### 5.2 DIAMONDS
=begin
Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.

PROBLEM
input: integer
  - odd

output: strings
  - spaces and asterixes
  - four pointed diamond
    - size is based on input integer: n
      - n x n grid
        top half:
          - spaces: n/2 down to 0 : (n - stars) / 2
          - stars: 1 up to n, step 2
        bottom half:
          - spaces: 1 up to n/2
          - stars: (n - 2) down to 1

EXAMPLES

DATA STRUCTURES
- input: odd integer: n
  - array of n strings
    -
- output: n strings

   *      0   1
  * *     1   3
 *   *    3   5
*     *   5   7
 *****
  ***
   *

ALGORITHM
- create the top half of the diamond (including middle row)
  - create a range from 1 up to n, stepping up by 2
    - this represent the number of stars in each row
  - transform this range into strings
    - spaces + stars
      - spaces = (n - stars) / 2
      - stars
- create the bottom half ot the diamond (not including middle row)
  - create a range from (n - 2) down to 1, stepping down by 2
    - this represents the number of stars in each row
  - transform this range into strings
    - spaces + stars
      - speace = (n - stars / 2)
      - stars
- join the top and bottom halves
  - add the two arrays together
- output the diamond to the screen

=end

# def diamond(size, filled: true)
#   top_half = filled ? filled_top_half(size) : hollow_top_half(size)
#   bottom_half = top_half.reverse[1..]
#   puts (top_half + bottom_half)
# end

# def filled_top_half(size)
#   (1..size).step(2).map do |stars|
#     spaces = (size - stars) / 2
#     (' ' * spaces) + ('*' * stars)
#   end
# end

# def hollow_top_half(size)
#   (1..size).step(2).map do |stars|
#     spaces = (size - stars) / 2
#     diamond = '*' * stars
#     center = diamond[1..-2]
#     diamond[1..-2] = ' ' * center.size
#     (' ' * spaces) + diamond
#   end
# end

# diamond(1, filled: false)
# diamond(3, filled: false)
# diamond(5, filled: false)
# diamond(7, filled: false)

### 4.2 LIGHTS
=begin
You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat this process and keep going until you have been through n repetitions.

Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.

Example with n = 5 lights:

    round 1: every light is turned on
    round 2: lights 2 and 4 are now off; 1, 3, 5 are on
    round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
    round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
    round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].
With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

7:39
PROBLEM
input: integer
  - represents number of lights and number of repetitions
    - lights:
      - can be either on or off
      - all start in off position
    - repetitions:
      - from 1 up to input integer
      -toggle every light that has that number as a factor
output: array
  - represents which lights are on after all repetitions are completed

EXAMPLES

DATA STRUCTURES
- input: integer
  - representation of switches:
    - hash: keys are switch number, values are status (boolean) # { 1: false, 2: true ...}
      - false = off, true = on
  - way to access every n switches on a particular repetition
    - range for each factor: 1 up to input integer
      - range from factor up to input integer
        - use factor as a step
  - way to select which switches are left on after all repetitions
    - keys with values of true
- output: array

ALGORITHM
- create a hash to represent the switches
  - keys are numbers 1 through input integer
  - values are all 'false'

- perform required number of repetitions, toggling appropriate switches on each repetition
  - consider each number from 1 up to the input integer
    - this represents the current repetition and current factor
    - for each factor, get the numbers that are products of that factor
      - these represent the switches to be toggled
        - start at current factor, up to input integer
        - count up by current factor (e.g. 3, 6, 9 . . .)
        - toggle the switch at that number

- select all the switch numbers that are on
  - return them in an array
=end

# def lights(number)
#   switches = initialize_switches(number)
#   (1..number).each do |factor|
#     (factor..number).step(factor).each do |switch|
#       switches[switch] = !switches[switch]
#     end
#   end
#   switches.keys.select { |switch| switches[switch] }
# end

# def initialize_switches(number)
#   (1..number).to_a.zip(Array.new(5, false)).to_h
# end

# p lights(5) == [1, 4]
# p lights(10) == [1, 4, 9]
# p lights(99) == [1, 4, 9, 16, 25, 36, 49, 64, 81]

### 3.2 ROTATION III
=begin
If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.

Write a method that takes an integer as argument, and returns the maximum rotation of that argument. You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

Note that you do not have to handle multiple 0s.

Examples:
max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped:  105, 051, 015
max_rotation(8_703_529_146) == 7_321_609_845:
7 035291468,
73 52914680,
732 9146805,
7321 468059,
73216 80594,
732160 5948,
7321609 485,
73216098 54,
732160984 5

PROBLEM
input: integer
  - does not contain multiple zeroes in a row
output: integer
  - 'maximum rotation' of input integer
    - rotate all digits, then all except first digit, etc, until you rotate final 2 digits
      - 'rotate' means to take the first digit of the number and move it to the end
        - a single digit rotated == itself

EXAMPLES

DATA STRUCTURES
- input: integer
  - array of separate digits

- output: integer

ALGORITHM
- create an array of the individual digits in the input integer
  - start at index 0, then 1, up to (length - 2)
    - delete the digit at that index of the array
      - add the deleted digit to the end of the array
  - join the digits into a string
  - convert the string into an integer, and return it

=end

# def max_rotation(number)
#   digits = number.digits.reverse
#   last_index = digits.size - 2
#   (0..last_index).each do |index|
#     removed = digits.delete_at(index)
#     digits << removed
#   end
#   digits.join.to_i
# end

# p max_rotation(735291) == 321579
# p max_rotation(3) == 3
# p max_rotation(35) == 53
# p max_rotation(105) == 15 # the leading zero gets dropped
# p max_rotation(8_703_529_146) == 7_321_609_845


### 2.2 ROTATION II
=begin
Write a method that can rotate the last n digits of a number. For example:

rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917

Note that rotating just 1 digit results in the original number being returned.
You may use the rotate_array method from the previous exercise if you want. (Recommended!)
You may assume that n is always a positive integer.

9:26
PROBLEM
input: 2 integers
  - first integer is the number that will have digits rotated
  - second integer is the number of digits to rotate
    - digits are from end of number (i.e. rightmost digits)
    - always a positive integer
    - presumably falls within range of 1 up to number of digits in first input number

output: integer
  - this is the input number with the requisite digits rotated
    - rotate: take the first digit of the group and move it to the end of the group
      - all other digits stay in the same order, they just move 'up' one place
    - all non-rotated digits in the input number remain the same
    - if second input integer is 1, input number will be unchanged

EXAMPLES

DATA STRUCTURES
- input: 2 integers (number, digits)
  - number converted to a string: numberstring
  - two substrings:
    - non-rotating digits: numberstring[0, (length - digits)]
    - rotating digits: numberstring[-digits, digits]
  - joined string after rotating second substring

- output: integer

ALGORITHM
- convert the first input integer into a string
- separate this string into two substrings
  - string[0, length - second input integer]
  - string[-second input integer, second input integer]
- rotate the second substring
  - substring2[1..-1] + substring[0]
- join the substring together
- convert this string into an integer and return it

=end

# def rotate_rightmost_digits(number, digits)
#   left_digits, right_digits = substrings(number, digits)
#   right_digits = rotate(right_digits)
#   (left_digits + right_digits).to_i
# end

# def substrings(number, digits)
#   string = number.to_s
#   left_digits = string[0, string.size - digits]
#   right_digits = string[-digits, digits]
#   [left_digits, right_digits]
# end

# def rotate(string)
#   string[1..-1] + string[0]
# end

# p rotate_rightmost_digits(735291, 1) == 735291
# p rotate_rightmost_digits(735291, 2) == 735219
# p rotate_rightmost_digits(735291, 3) == 735912
# p rotate_rightmost_digits(735291, 4) == 732915
# p rotate_rightmost_digits(735291, 5) == 752913
# p rotate_rightmost_digits(735291, 6) == 352917


### 1.2 ROTATION I
=begin
Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

Do not use the method Array#rotate or Array#rotate! for your implementation.

4:04
PROBLEM
input: array
  - type of elements not specified
output: array
  - new (input array is not modified)
  - contains all the same elements as input array
    - order is different
      - first element of input array is last element of output array
      - all other elements move up 1 place
      - if input array only has one element, so does output array

EXAMPLES

DATA STRUCTURES
- input: array
  - [a, b, c] => [b, c, a]
    [0, 1, 2] => [1, 2, 0]

- output: new array

ALGORITHM
- transform input array using indexes
  - new index is input index + 1
    - unless index is last index, then == 0
=end

# def rotate_array(array)
#   array.each_index.map do |index|
#     if index == array.size - 1
#       array[0]
#     else
#       array[index + 1]
#     end
#   end
# end

# def rotate_array(array)
#   array.each_index.map { |index| array[(index + 1) % array.size] }
# end

# p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']

# x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# p x == [1, 2, 3, 4]                 # => true


### 8 FIBONACCI NUMBERS (RECURSION)
# def fibonacci(nth)

# end

# fibonacci(1) == 1
# fibonacci(2) == 1
# fibonacci(3) == 2
# fibonacci(4) == 3
# fibonacci(5) == 5
# fibonacci(12) == 144
# fibonacci(20) == 6765

### 7 WORD TO DIGIT
# numbers = %w(zero one two three four five six seven eight nine)
# digits = ('0'..'9').to_a
# NUMBERS_TO_DIGITS = numbers.zip(digits).to_h

# def word_to_digit(words)
#   words.split.map do |word|
#     NUMBERS_TO_DIGITS.each do |number, digit|
#       word[number] = digit if word.include?(number)
#     end
#     word
#   end.join(' ')
# end

# ### using indexes instead of a hash
# NUMBERS = %w(zero one two three four five six seven eight nine)

# def word_to_digit(words)
#   words.split.map do |word|
#     NUMBERS.each_with_index do |number, index|
#       word[number] = index.to_s if word.include?(number)
#     end
#     word
#   end.join(' ')
# end
# ###

# p word_to_digit('Please call me at five five five one two three four. Thanks.') #== 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# def word_to_digit(words)
#   WORDS_TO_DIGITS.keys.each do |word|
#     words.gsub!(/\b#{word}\b/, WORDS_TO_DIGITS[word])
#   end
#   words
# end

# def word_to_digit(words)
#   WORDS_TO_DIGITS.each do |word, digit|
#     words.gsub!(/\b#{word}\b/, digit)
#   end
#   words
# end


# p word_to_digit('Please call me at five five five one two three four. Thanks.') #== 'Please call me at 5 5 5 1 2 3 4. Thanks.'

### 6 STACK MACHINE INTERPRETATION
#### With memory hash
# VALID_TOKENS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

# OPERATORS = {
#   'ADD' => :+,
#   'SUB' => :-,
#   'MULT' => :*,
#   'DIV' => :/,
#   'MOD' => :%
# }

# def minilang(program)
#   return "Error: invalid token(s) in program" unless all_tokens_valid?(program)
#   memory = {register: 0, stack: []}
#   process_program(program, memory)
# end

# def all_tokens_valid?(program)
#   program.split.all? { |token| valid_token?(token) }
# end

# def valid_token?(token)
#   VALID_TOKENS.include?(token) || token.to_i.to_s == token
# end

# def process_program(program, memory)
#   program.split.each do |token|
#     return "Error: empty stack" if stack_error?(memory[:stack], token)
#     memory[:register] = process_token(memory, token)
#   end
#   nil
# end

# def stack_error?(stack, token)
#   stack.empty? && (token == 'POP' || OPERATORS.include?(token))
# end

# def process_token(memory, token)
#   inputs = [memory[:register], memory[:stack], token]
#   OPERATORS.include?(token) ? calculation(inputs) : other_operation(inputs)
# end

# def calculation(inputs)
#   register, stack, token = inputs
#   operands = [register, stack.pop]
#   operator = OPERATORS[token]
#   operands.inject(operator)
# end

# def other_operation(inputs)
#   register, stack, token = inputs
#   case token
#   when 'POP' then register = stack.pop
#   when 'PUSH' then stack << register; register
#   when 'PRINT' then p register
#   else register = token.to_i
#   end
# end
# ####
# p minilang('PRINT') # 0
# p minilang('5 PUSH 3 MULT PRINT') # 15
# p minilang('5 PRINT PUSH 3 PRINT ADD PRINT') # 5  3  8
# p minilang('5 PUSH POP PRINT') # 5
# p minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT') # 5  10  4  7
# p minilang('3 PUSH PUSH 7 DIV MULT PRINT ') # 6
# p minilang('4 PUSH PUSH 7 MOD MULT PRINT ') # 12
# p minilang('-3 PUSH 5 SUB PRINT') # 8
# p minilang('6 PUSH')

# p minilang('3 PUSH 5 MOD PUSH 7 PUSH 3 PUSH 4 PUSH 5 MULT ADD SUB DIV') # 8
# p minilang("#{(3 + (4 * 5) - 7) / (5 % 3)} PRINT") # 8


#### With Error Handling
# VALID_TOKENS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

# OPERATORS = {
#   'ADD' => :+,
#   'SUB' => :-,
#   'MULT' => :*,
#   'DIV' => :/,
#   'MOD' => :%
# }

# def minilang(program)
#   return "Error: invalid token(s) in program" unless all_tokens_valid?(program)
#   process_program(program)
# end

# def all_tokens_valid?(program)
#   program.split.all? { |token| valid_token?(token) }
# end

# def valid_token?(token)
#   VALID_TOKENS.include?(token) || token.to_i.to_s == token
# end

# def process_program(program)
#   register = 0
#   stack = []

#   program.split.each do |token|
#     return "Error: empty stack" if stack_error?(stack, token)
#     register = process_token(register, stack, token)
#   end
#   nil
# end

# def stack_error?(stack, token)
#   stack.empty? && (token == 'POP' || OPERATORS.include?(token))
# end

# def process_token(register, stack, token)
#   inputs = [register, stack, token]
#   OPERATORS.include?(token) ? calculation(inputs) : other_operation(inputs)
# end

# def calculation(inputs)
#   register, stack, token = inputs
#   operands = [register, stack.pop]
#   operator = OPERATORS[token]
#   operands.inject(operator)
# end

# def other_operation(inputs)
#   register, stack, token = inputs
#   case token
#   when 'POP' then register = stack.pop
#   when 'PUSH' then stack << register; register
#   when 'PRINT' then p register
#   else register = token.to_i
#   end
# end
####

####
# def minilang(program)
#   register = 0
#   stack = []
#   program.split.each do |token|
    # case token
    # when 'PUSH'   then stack << register
    # when 'ADD'    then register += stack.pop
    # when 'SUB'    then register -= stack.pop
    # when 'MULT'   then register *= stack.pop
    # when 'DIV'    then register /= stack.pop
    # when 'MOD'    then register %= stack.pop
    # when 'POP'    then register = stack.pop
    # when 'PRINT'  then puts register
    # else register = token.to_i
    # end
#   end
#   p register
#   p stack
# end
####

# program = '3 PUSH 5 MOD PUSH 7 PUSH 3 PUSH 4 PUSH 5 MULT ADD SUB DIV'
# cheating = "#{(3 + (4 * 5) - 7) / (5 % 3)} PRINT"
# p minilang(cheating)

# minilang('PRINT') # 0
# minilang('5 PUSH 3 MULT PRINT') # 15
# minilang('5 PRINT PUSH 3 PRINT ADD PRINT') # 5  3  8
# minilang('5 PUSH POP PRINT') # 5
# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT') # 5  10  4  7
# minilang('3 PUSH PUSH 7 DIV MULT PRINT ') # 6
# minilang('4 PUSH PUSH 7 MOD MULT PRINT ') # 12
# minilang('-3 PUSH 5 SUB PRINT') # 8
# minilang('6 PUSH')

### 5 DIAMONDS!
### initial solution
# def diamond(max_width)
#   rows = get_rows(max_width)
#   display_diamond(rows)
# end

# def get_rows(max_width)
#   row_widths = get_row_widths(max_width)
#   row_widths.map { |row_width| ('*' * row_width).center(max_width) }
# end

# def get_row_widths(max_width)
#   top_row_widths = (1..max_width).step(2).to_a
#   bottom_row_widths = (top_row_widths - [max_width]).reverse
#   top_row_widths + bottom_row_widths
# end

# def display_diamond(rows)
#   rows.each { |row| puts row }
# end

# diamond(1)
# diamond(3)
# diamond(9)
# ###

# ### hollow diamond solution
# def hollow_diamond(max_width)
#   rows = get_rows(max_width)
#   display_diamond(rows)
# end

# def get_rows(max_width)
#   row_widths = get_row_widths(max_width)
#   rows = row_widths.map { |width| width == 1 ? '*' : "*#{' ' * (width - 2)}*" }
#   rows.map { |row| row.center(max_width) }
# end

# def get_row_widths(max_width)
#   top_row_widths = (1..max_width).step(2).to_a
#   bottom_row_widths = (top_row_widths - [max_width]).reverse
#   top_row_widths + bottom_row_widths
# end

# def display_diamond(rows)
#   rows.each { |row| puts row }
# end

# hollow_diamond(1)
# hollow_diamond(3)
# hollow_diamond(9)
###

### choice solution
# def diamond(max_width, hollow: false)
#   rows = get_rows(max_width, hollow)
#   display_diamond(rows)
# end

# def get_rows(max_width, hollow)
#   row_widths = get_row_widths(max_width)
#   rows = hollow ? get_hollow_rows(row_widths) : get_filled_rows(row_widths)
#   rows.map { |row| row.center(max_width) }
# end

# def get_row_widths(max_width)
#   ((1...max_width).to_a + max_width.downto(1).to_a).select(&:odd?)
# end

# def get_hollow_rows(row_widths)
#   row_widths.map { |width| width == 1 ? '*' : "*#{' ' * (width - 2)}*" }
# end

# def get_filled_rows(row_widths)
#   row_widths.map { |row_width| '*' * row_width }
# end

# def display_diamond(rows)
#   rows.each { |row| puts row }
# end

# diamond(1)
# diamond(3)
# diamond(9)
# diamond(1, hollow: true)
# diamond(3, hollow: true)
# diamond(9, hollow: true)

### 4 1000 LIGHTS
### initial solution
# def toggle_lights(number_of_lights)
#   switches = (1..number_of_lights).map { |switch| [switch, false]}.to_h
#   1.upto(number_of_lights) do |round_number|
#     (round_number..number_of_lights).step(round_number) do |switch|
#       switches[switch] = !switches[switch]
#     end
#   end
#   switches.keys.select { |switch| switches[switch] }
# end

# p toggle_lights(100)
###


# ## refactored, with (a lot of) helper methods
# def toggle_lights(number_of_lights)
#   switches = initialize_switches(number_of_lights)
#   toggle_switches!(switches)
#   get_on_lights(switches)
# end

# def initialize_switches(number_of_lights)
#   (1..number_of_lights).map { |switch| [switch, false]}.to_h
# end

# def toggle_switches!(switches)
#   1.upto(switches.size) do |round_number|
#     step_through_switches(round_number, switches)
#   end
# end

# def step_through_switches(factor, switches)
#   (factor..switches.size).step(factor) do |switch|
#     toggle_one_switch!(switches, switch)
#   end
# end

# def toggle_one_switch!(switches, switch)
#   switches[switch] = !switches[switch]
# end

# def get_on_lights(switches)
#   switches.keys.select { |switch| switches[switch] }
# end

# p toggle_lights(100)
###


### pattern solutions
# def toggle_lights(number_of_lights)
#   lights_on = []
#   current_light = 1
#   until (current_light ** 2) > number_of_lights
#     lights_on << (current_light ** 2)
#     current_light += 1
#   end
#   lights_on
# end

# def toggle_lights(number_of_lights)
#   (1..number_of_lights).filter_map do |current_light|
#     current_light ** 2 if (current_light ** 2 <= number_of_lights)
#   end
# end

# def toggle_lights(number_of_lights)
#   (1..Integer.sqrt(number_of_lights)).map { |current_light| current_light ** 2 }
# end

# def toggle_lights(number_of_lights)
#   (1..Integer.sqrt(number_of_lights)).map(&:abs2)
# end


# selects the light numbers with an odd number of unique factors
# def toggle_lights(number_of_lights)
#   (1..number_of_lights).select do |light_number|
#     factors = (1..light_number).select { |factor| light_number % factor == 0 }
#     factors.size.odd?
#   end
# end

# def toggle_lights(number_of_lights)
#   (1..number_of_lights).select do |light_number|
#     light_on = false
#     1.upto(light_number) do |factor|
#       light_on = !light_on if light_number % factor == 0
#     end
#     light_on
#   end
# end

# p toggle_lights(100)
###


### using array instead of hash
# def toggle_lights(number_of_lights)
#   switches = Array.new(number_of_lights, false)
#   1.upto(switches.size) do |round|
#     (round..switches.size).step(round) do |switch|
#       index = switch - 1
#       switches[index] = !switches[index]
#     end
#   end
#   switches.map.with_index { |status, idx| (idx + 1) if status }.compact
# end


# def toggle_lights(number_of_lights)
#   switches = Array.new(number_of_lights, false)
#   1.upto(switches.size) do |round|
#     (round..switches.size).step(round) do |switch|
#       index = switch - 1
#       switches[index] = !switches[index]
#     end
#   end
#   switches.filter_map.with_index(1) { |status, idx| idx if status }
#   # switches.filter_map.with_index { |status, idx| (idx + 1) if status }
# end

# p toggle_lights(100)
###


### with text display and rounds ######################### vvvvv
# def toggle_lights(number_of_lights, rounds = number_of_lights)
#   switches = initialize_switches(number_of_lights)
#   display_rounds(switches, rounds)
#   display_final_result(switches, rounds)
# end

# def initialize_switches(number_of_lights)
#   (1..number_of_lights).map { |switch| [switch, false]}.to_h
# end

# def display_rounds(switches, rounds)
#   puts "Begin: All lights start in the off position."
#   1.upto(rounds) do |round|
#     toggle_switches!(switches, round)
#     display_current_status(switches, round)
#   end
# end

# def toggle_switches!(switches, round)
#   (round..switches.size).step(round) do |switch|
#     switches[switch] = !switches[switch]
#   end
# end

# def display_current_status(switches, round)
#   toggled_message = toggled_message(switches, round)
#   off_message = compose_lights_message(switches, 'off')
#   on_message = compose_lights_message(switches, 'on')
#   puts "Round #{round}: #{toggled_message}"
#   puts "  #{off_message}" unless off_message.empty?
#   puts "  #{on_message}" unless on_message.empty?
# end

# def toggled_message(switches, round)
#   toggled_switches = get_toggled_switches(switches, round)
#   toggled_message = compose_toggled_message(toggled_switches)
#   (toggled_switches.empty? ? "No switches are" : "Switch#{toggled_message}") +
#     " toggled."
# end

# def get_toggled_switches(switches, round)
#   (round..switches.size).step(round).map(&:itself)
# end

# def compose_toggled_message(toggled_switches)
#   case toggled_switches.size
#   when 0 then ""
#   when 1 then " #{toggled_switches.first} is"
#   when 2 then "es #{toggled_switches.join(" and ")} are"
#   else "es #{toggled_switches[0..-2].join(", ")}, " +
#     "and #{toggled_switches.last} are"
#   end
# end

# def compose_lights_message(switches, status)
#   group = get_group(switches, status)
#   case group.size
#   when 0 then ""
#   when switches.size then "Every light is now #{status}. "
#   when 1 then "1 light is now #{status}: #{group.last}. "
#   when 2 then "2 lights are now #{status}: #{group.join(" and ")}. "
#   else "#{group.size} lights are now #{status}: " +
#     "#{group[0..-2].join(", ")}, and #{group.last}. "
#   end
# end

# def get_group(switches, status)
#   switches.keys.select do |switch|
#     status == 'off' ? !switches[switch] : switches[switch]
#   end
# end

# def display_final_result(switches, rounds)
#   on_group = get_group(switches, 'on')
#   lights = "#{switches.size} light" + (switches.size == 1 ? "" : "s")
#   rounds = "#{rounds} round" + (rounds == 1 ? "" : "s")
#   result = result(switches, on_group, 'on')
#   puts
#   puts "With #{lights} and #{rounds}, the result is that #{result}."
#   puts "The return value is: #{on_group}."
# end

# def result(switches, group, status)
#   case group.size
#   when 0 then "no lights are left #{status}"
#   when switches.size then "every light is left #{status}"
#   when 1 then "1 light is left #{status}: #{group.first}"
#   when 2 then "2 lights are left #{status}: #{group.join(" and ")}"
#   else "#{group.size} lights are left #{status}: " +
#     "#{group[0..-2].join", "}, and #{group.last}"
#   end
# end

# toggle_lights(10, 6)
### with text display and rounds ######################### ^^^^^

# switches = {  1=>false, 2=>false, 3=>false, 4=>true,  5=>true,
#               6=>true, 7=>true, 8=>true, 9=>true, 10=>true  }

####

### 3 ROTATION III
# # initial solution, with a helper method
# def rotate_rightmost_digits(num, n)
#   digits = num.digits.reverse
#   (digits << digits.delete_at(-n)).join.to_i
# end

# def max_rotation(integer)
#   digits = integer.digits.reverse
#   digits.each_index do |idx|
#     integer = rotate_rightmost_digits(integer, digits.size - idx)
#   end
#   integer
# end

# def max_rotation(integer) # LS Solution
#   number_of_digits = integer.digits.size
#   number_of_digits.downto(2) do |num|
#     integer = rotate_rightmost_digits(integer, num)
#   end
#   integer
# end

############ vvv Without a helper method vvv
# def max_rotation(integer)
#   digits = integer.digits.reverse
#   digits.each_index do |idx|
#     digits << digits.delete_at(idx)
#   end.join.to_i
# end

# def max_rotation(integer) # basically LS solution
#   digits = integer.digits.reverse
#   digits.size.downto(2) do |num|
#     digits << digits.delete_at(-num)
#   end
#   digits.join.to_i
# end
############### ^^^ Without a helper method ^^^

# p max_rotation(735291) == 321579
# p max_rotation(3) == 3
# p max_rotation(35) == 53
# p max_rotation(105) == 15 # the leading zero gets dropped
# p max_rotation(8_703_529_146) == 7_321_609_845

################### vvv preserve zeros vvv
### With a helper method
# def rotate_rightmost_elements(array, n)
#   array << array.delete_at(n)
# end

# def max_rotation_with_zeros(integer)
#   digits = integer.digits.reverse
#   digits.each_index do |idx|
#     digits = rotate_rightmost_elements(digits, idx)
#   end.join.to_i
# end

#### Without a helper method
# def max_rotation_with_zeros(integer)
#   digits = integer.digits.reverse
#   digits.each_index do |idx|
#     digits << digits.delete_at(idx)
#   end
#   digits[0] == 0 ? digits.join : digits.join.to_i
# end

######### Daniel Chae vvv
# FE one-liner; works for consecutive zeros in input arg
# def max_rotation_with_zeros(x)
#   (d = x.to_s).size.times.reduce(d) { |d, i| d + (d.slice!(i) || "") }.to_i
# end

# def max_rotation_with_zeros(integer) # above expanded
#   string = integer.to_s
#   string.size.times.reduce(string) do |string, idx|
#     # string + (string.slice!(idx) || "") # is || needed?
#     string << string.slice!(idx)
#   end.to_i
# end

# without using strings
# def max_rotation_with_zeros(x)
#   (d = x.digits.reverse).each_index { |i| d << d.delete_at(i) }.reduce(0) { |y, z| y * 10 + z }
# end

# def max_rotation_with_zeros(integer) # above expanded
#   digits = integer.digits.reverse
#   digits.each_index do |idx|
#     digits << digits.delete_at(idx)
#   end
#   digits.reduce(0) { |sum, digit| sum * 10 + digit }
# end
######## Daniel Chae ^^^

# p max_rotation_with_zeros(735291) == 321579
# p max_rotation_with_zeros(3) == 3
# p max_rotation_with_zeros(35) == 53
# p max_rotation_with_zeros(105) == '015'
# p max_rotation_with_zeros(8_703_529_146) == 7_321_609_845
# p max_rotation_with_zeros(10023) == '02130'
# p max_rotation_with_zeros(10003) == '00130'
######################## ^^^ preserve zeros ^^^


### 2 ROTATION II
######################## vvv using helper method vvv

# def rotate_array(array)
#   array.empty? ? array : array[1..] + array[0, 1]
# end

# def rotate_rightmost_digits(number, n)
#   digits = number.to_s.chars
#   head, tail = digits.partition.with_index { |_, idx| idx < digits.size - n }
#   (head + rotate_array(tail)).join.to_i
# end

# def rotate_rightmost_digits(number, n)
#   digits = number.to_s.chars
#   tail = digits[-n..]
#   (digits - tail + rotate_array(tail)).join.to_i
# end

# def rotate_rightmost_digits(number, n)
#   digits = number.to_s.chars
#   tail = digits.drop(digits.size - n)
#   (digits - tail + rotate_array(tail)).join.to_i
# end

# def rotate_rightmost_digits(number, n)
#   digits = number.digits.reverse
#   digits.size.times.map do |idx|
#     if idx < digits.size - n
#       digits[idx]
#     else
#       idx == digits.size - 1 ? digits[digits.size - n] : digits[idx + 1]
#     end
#   end.join.to_i
# end

# def rotate_rightmost_digits(number, n)
#   digits = number.digits.reverse
#   head = digits.size - n
#   digits.each_index.map do |idx|
#     idx < head ? digits[idx] : digits[(((idx - head) + 1) % n) + head]
#   end.join.to_i
# end

#############

# def rotate_integer(int)
#   (int.to_s[1..] + int.to_s[0, 1]).to_i
# end

# def rotate_rightmost_digits(num, n)
#   tail = num % 10**n
#   num - tail + rotate_integer(tail)
# end

######################## ^^^ using helper method ^^^

######################## vvv no helper method vvv

# def rotate_rightmost_digits(num, n)
#   digits = num.digits.reverse
#   (digits << digits.delete_at(-n)).join.to_i
# end

# def rotate_rightmost_digits(num, n)
#   tail = num % 10**n
#   divisor = 10**(n-1)
#   rotated_tail = ((tail % divisor) * 10) + (tail / divisor)
#   num - tail + rotated_tail
# end

######################## ^^^ no helper method ^^^

########### Daniel Chae
# one-liner; no strings
# def rotate_rightmost_digits(num, n)
#   digits = num.digits.reverse # [7, 3, 5, 2, 9, 1]
#   (digits << digits.delete_at(-n)).reduce(0) do |sum, digit|
#     sum * 10 + digit
#   end
# end
###########

# p rotate_rightmost_digits(735291, 0) == 735291
# p rotate_rightmost_digits(735291, 1) == 735291
# p rotate_rightmost_digits(735291, 2) == 735219
# p rotate_rightmost_digits(735291, 3) == 735912
# p rotate_rightmost_digits(735291, 4) == 732915
# p rotate_rightmost_digits(735291, 5) == 752913
# p rotate_rightmost_digits(735291, 6) == 352917
# p rotate_rightmost_digits(735291, 7) == 352917


### 1 ROTATION I
# initial solution
# def rotate_array(array)
#   array.each_index.map { |idx| array[(idx == array.size - 1) ? 0 : idx + 1] }
# end

# # basically the LS solution modified to handle empty arrays
# def rotate_array(array)
#   array.empty? ? array : array[1..] << array[0]
# end

# # similar approach as initial solution
# def rotate_array(array)
#   array.each_index.with_object(Array.new(array.size)) do |idx, result|
#     result[idx - 1] = array[idx]
#   end
# end

# # also similar, but with negative indexing instead
# def rotate_array(array)
#   array.each_index.map { |idx| array[idx - (array.size - 1)] }
# end

# # using modulo to get target indexes
# def rotate_array(array)
#   new_indexes = (1..array.size).map { |num| num % array.size }
#   new_indexes.map { |idx| array[idx] }
# end

# # same concept as above but more concise
# def rotate_array(array)
#   array.each_index.map { |idx| array[(idx+1) % array.size] }
# end

# # a couple of non-iterative solutions
# def rotate_array(array)
#   array.drop(1) + array.take(1)
# end

# def rotate_array(array)
#   first, *rest = array # if array is empty, first will equal nil
#   first ? rest << first : array
# end

# p rotate_array([1, 2, 3, 4, 5, 6]) == [2, 3, 4, 5, 6, 1]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']
# p rotate_array([]) == []

# x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# p x == [1, 2, 3, 4]                 # => true

###################################
# def rotate_object(object)
#   case object
#   when Array, String
#     object.empty? ? object : object[1..] + object[0, 1]
#   when Hash
#     rotate_object(object.to_a).to_h
#   when Integer
#     rotate_object(object.to_s).to_i
#   else
#     "Unable to rotate this type of object."
#   end
# end

# array = [1, 2, 3]
# p rotate_object([]) == []
# p rotate_object(array) == [2, 3, 1]
# p array == [1, 2, 3]
# puts
# string = '123'
# p rotate_object('') == ''
# p rotate_object(string) == '231'
# p string == '123'
# puts
# hash = {a: 1, b: 2, c: 3}
# p rotate_object({}) == {}
# p rotate_object(hash) == {b: 2, c: 3, a: 1}
# p hash == {a: 1, b: 2, c: 3}
# puts
# integer = 123
# p rotate_object(0) == 0
# p rotate_object(integer) == 231
# p integer == 123
# puts
# p rotate_object(102) # => 21
# p rotate_object(1.2) # => "Unable to rotate this type of object."

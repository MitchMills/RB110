### 8.2 FEATURED NUMBER
=begin
A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Return an error message if there is no next featured number.

PROBLEM 8:10
input: integer

output: integer
  - next 'featured' number
    - odd &&
    - multiple of 7
    - no repeat digits
  - error message if no next featured number

EXAMPLES

DATA STRUCTURES
- needs:
  - iterate integers upwards from input integer
  - determine whether odd
  - determine whether multiple of 7
  - determine whether digits are unique

- start: integer
  - next odd multiple of seven
  - numbers incremented by 14
  - check for unique digits
- end: integer or error message

ALGORITHM
- find next odd multiple of 7 greater than input integer
  - increment by 1 until found
  - return if unique digits
- Otherwise increment by 14
  - return if unique digits
- Return error message if no number found before reaching 9_876_543_210

- determine unique digits
  - convert number to array of digits and compare to unique version of that array
=end

MAX_FEATURED_NUMBER = 9_876_543_201

def featured(number)
  return error_message if number >= MAX_FEATURED_NUMBER
  starting_number = find_next_odd_multiple_of_seven(number + 1)
  next_featured_number(starting_number)
end

def error_message
  'There is no possible number that fulfills those requirements'
end

def find_next_odd_multiple_of_seven(number)
  number += 1 until number.odd? && number % 7 == 0
  number
end

def next_featured_number(starting_number)
  (starting_number...MAX_FEATURED_NUMBER).step(14).find do |number|
    unique_digits?(number)
  end
end

# def unique_digits?(number)
#   number.to_s.chars == number.to_s.chars.uniq
# end

def unique_digits?(number)
  digits = ('0'..'9').to_a
  string_num = number.to_s
  digits.all? do |digit|
    string_num.count(digit) < 2
  end
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

### 11 IS IT PRIME?
=begin
A prime number is a positive number that is evenly divisible only by itself and 1. Thus, 23 is prime since its only divisors are 1 and 23. However, 24 is not prime since it has divisors of 1, 2, 3, 4, 6, 8, 12, and 24. Note that the number 1 is not prime.

Write a method that takes a positive integer as an argument and returns true if the number is prime, false if it is not prime.

You may not use Ruby's Prime class to solve this problem. Your task is to programmatically determine whether a number is prime without relying on any methods that already do that for you.

PROBLEM
input: integer
  - positive

output: boolean
  - true if input integer is prime, false otherwise
  - prime:
    - evenly divisible only by 1 and itself
    - NB 1 is not prime

EXAMPLES

DATA STRUCTURES
- needs:
  - way to consider every number between 2 and integer square root of input integer

- input: integer
  - range from 2 up to integer square root of input integer
- output: boolean

ALGORITHM
- consider every number between 2 and the integer square root of the input integer, inclusive
  - create a range from 2 up to ISR of input integer
- if any number divides evenly into the input integer, return false
  - for each number in the range, get the remainder of dividing the input integer by it
  - if remainder is 0, return false
- otherwise return true
=end

# def is_prime?(number)
#   return false if number == 1
#   (2..Integer.sqrt(number)).each do |divisor|
#     return false if number % divisor == 0
#   end
#   true
# end

# p is_prime?(1) == false
# p is_prime?(2) == true
# p is_prime?(3) == true
# p is_prime?(4) == false
# p is_prime?(5) == true
# p is_prime?(6) == false
# p is_prime?(7) == true
# p is_prime?(8) == false
# p is_prime?(9) == false
# p is_prime?(10) == false
# p is_prime?(23) == true
# p is_prime?(24) == false
# p is_prime?(997) == true
# p is_prime?(998) == false
# p is_prime?(3_297_061) == true
# p is_prime?(23_297_061) == false



### 10 SUM SQUARE
=begin
Write a method that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.

PROBLEM
input: integer
  - positive
  - represents the number of positive integers to use in the calculation
    - e.g. 3 -> 1, 2, 3

output: integer
  - difference between:
    - all numbers added together then squared: (1 + 2 + 3)**2
    - each number squared then all added together: 1**2 + 2**2 + 3**2

EXAMPLES

DATA STRUCTURES
- needs:
  - list of all positive integers up to input integer
    - sum squared
    - each squared then summed

- input: integer
  - range from 1 up to integer
  - sum of that range, squared
  - each number in the range squared, then summer
  - difference = output
- output: integer

ALGORITHM
- get the sum of all integers and square it
  - create a range from 1 up to the input integer
    - get the sum
- square every integer and sum the squares
  - create a range from 1 up to the input integer (or re-use range above)
    - for each number in the range, square it and add it to a total
- get the difference and return it
  - subtract the second number from the first
=end

# def sum_square_difference(number)
#   sum_squared(number) - sum_of_squares(number)
# end

# def sum_squared(number)
#   (1..number).sum**2
# end

# def sum_of_squares(number)
#   (1..number).sum(&:abs2)
# end

# p sum_square_difference(3) == 22 # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
# p sum_square_difference(10) == 2640
# p sum_square_difference(1) == 0
# p sum_square_difference(100) == 25164150



### 9 BUBBLE SORT
=begin
Write a method that takes an Array as an argument, and sorts that Array using the bubble sort algorithm as just described. Note that your sort will be "in-place"; that is, you will mutate the Array passed as an argument. You may assume that the Array contains at least 2 elements.

PROBLEM
input: array
  - will contain at least 2 elements
    - elements can be integers, strings, . . .
output: array
  - mutated input array (i.e. same array)
  - elements are sorted

EXAMPLES

DATA STRUCTURES
- needs:
  - examine each pair
  - swap pair when necessary
  - keep track of whether a swap was made on the current pass
  - keep track of number of passes:
    - each successive pass can examine one less element than previous pass

- input: array
  - boolean to track whether swap was made this pass
  - integer to track number of elements to examine on this pass
    - (size of input array) - (number of current pass (start at 0))
  - indexes of two current elements being compared (and possibly swapped)
- output: array

ALGORITHM
- examine each pair of elements in the input array
  - swap pairs when the first element is greater than the second
    - otherwise leave as is
- if any swaps were made during that pass, repeat the process
- if no swaps were made, return the array


- create an integer to track the number of the current pass
  - set it to 0

- create a boolean to represent whether a swap has been made on current pass
  - set it to false
- create a range to represent the index of the current first element
  - 0 up to (array length - 2 - current pass)
  - second element index will be current first element index + 1
- for each number in the range
  - compare the element at that index to the element at that index + 1
    - if the first element is less than the second, swap them
      - change the swap boolean to true
    - otherwise leave as is
- if swap boolean is true
  - increment pass integer
  - repeat process
- if swap boolean is false, return array

=end

# def bubble_sort!(list)
#   last_index = list.size - 2
#   loop do
#     swapped = check_pairs(list, last_index)
#     break unless swapped
#     last_index -= 1
#   end
# end

# def check_pairs(list, last_index)
#   swapped = false
#   (0..last_index).each do |index|
#     next if list[index] <= list[index + 1]
#     swap_elements!(list, index)
#     swapped = true
#   end
#   swapped
# end

# def swap_elements!(list, index)
#   list[index], list[index + 1] = list[index + 1], list[index]
# end

# array = [5, 3]
# bubble_sort!(array)
# p array == [3, 5]

# array = [6, 2, 4, 7, 1, 4]
# bubble_sort!(array)
# p array == [1, 2, 4, 4, 6, 7]

# array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# bubble_sort!(array)
# p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)


### 8 NEXT FEATURED NUMBER
=begin
A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Return an error message if there is no next featured number.

PROBLEM
input: integer

output: integer
  - represents the next 'featured' number greater than the input integer
  - featured number
    - odd
    - evenly divisible by 7
    - digits occur exactly once each
  - return error message if there is no next featured number

EXAMPLES

DATA STRUCTURES
- input: integer
  - next multiple of 7 greater than input integer
    - from there check following multiples of 7 until a result is reached
      - or no result can be reached (i.e. one of each digit)
        - max is 9_876_543_210
- output: integer

ALGORITHM
- get the next multiple of 7 greater than the input integer
  - keep adding one to input integer until a multiple of 7 is reached
- from that number, check every multiple of 7 between it an 9_876_543_210
  - keep going unless number is odd
    - if odd, check if all digits are unique
      - convert the number to an array of digits
        - compare it to an array of only unique digits
      - if all unique, return that number
    - else, keep going
    - if max is reached, return error message
=end

# MAX_NUMBER_WITH_UNIQUE_DIGITS = 9_876_543_210

# FEATURED_REQUIREMENTS = {
#   parity: :odd,
#   multiple_of: 7,
#   unique_digits: true
# }

# def featured(number, requirements = FEATURED_REQUIREMENTS)
#   return no_solution_message if no_solution?(number, requirements)

#   start_number = start_number(number, requirements)
#   factor = requirements[:multiple_of]

#   (start_number..).step(factor * 2).find do |num|
#     requirements[:unique_digits] ? all_digits_unique?(num) : num
#   end
# end

# def no_solution_message
#   "There is no number that can fulfill the given requirements."
# end


# def no_solution?(number, requirements)
#   (requirements[:unique_digits] && number >= MAX_NUMBER_WITH_UNIQUE_DIGITS) ||
#   (requirements[:parity] == :odd && requirements[:multiple_of].even?)
# end

# def start_number(number, requirements)
#   factor = requirements[:multiple_of]
#   next_multiple = next_multiple(number, factor)

#   if requirements[:parity] == :odd
#     next_multiple.odd? ? next_multiple : next_multiple + factor
#   elsif requirements[:parity] == :even
#     next_multiple.even? ? next_multiple : next_multiple + factor
#   end
# end

# def next_multiple(number, factor)
#   ((number / factor) + 1) * factor
# end

# def all_digits_unique?(number)
#   number.digits.size == number.digits.uniq.size
# end

# p featured(12) == 21
# p featured(20) == 21
# p featured(21) == 35
# p featured(997) == 1029
# p featured(1029) == 1043
# p featured(999_999) == 1_023_547
# p featured(999_999_987) == 1_023_456_987

# p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements


### 7 UNLUCKY DAYS
=begin
Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.

PROBLEM
input: integer
  - represents a year
  - will be greater than 1752
output: integer
  - represents the number of Friday the 13ths in that year

EXAMPLES

DATA STRUCTURES
- input: integer
  - range from 1 to 12 to represent each month
- output: integer

ALGORITHM
- create a range from 1 to 12
- for each number in the range
  - create a new date object
    - year is input integer
    - month is current number in range
    - day is 13
- count the number of those days that are Fridays
=end
# require 'date'

# def friday_13th(year)
#   (1..12).count { |month| Date.new(year, month, 13).friday? }
# end

# p friday_13th(2015) == 3
# p friday_13th(1986) == 1
# p friday_13th(2019) == 2

# def number_of_five_friday_months(year)
#   all_fridays(year).count { |fridays| fridays.size == 5 }
# end

# def five_friday_months(year)
#   months = all_fridays(year).each_with_index.filter_map do |fridays, index|
#     index + 1 if fridays.size == 5
#   end
#   months.map { |month| Date::MONTHNAMES[month] }
# end

# def all_fridays(year)
#   all_fridays = (1..12).map do |month|
#     (1..31).select do |day|
#       date = [year, month, day]
#       Date.valid_date?(*date) && Date.new(*date).friday?
#     end
#   end
# end

# p number_of_five_friday_months(2024) # => 4
# p five_friday_months(2024) # => ["March", "May", "August", "November"]


### 6 TRI ANGLES
=begin
A triangle is classified as follows:

  - right: One angle of the triangle is a right angle (90 degrees)
  - acute: All 3 angles of the triangle are less than 90 degrees
  - obtuse: One angle is greater than 90 degrees.

To be a valid triangle, the sum of the angles must be exactly 180 degrees, and all angles must be greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the 3 angles of a triangle as arguments, and returns a symbol :right, :acute, :obtuse, or :invalid depending on whether the triangle is a right, acute, obtuse, or invalid triangle.

You may assume integer valued angles so you don't have to worry about floating point errors. You may also assume that the arguments are specified in degrees.

PROBLEM
input: three integers
  - represent the angles of a potential triangle
    - specified in degrees
output: symbol
  - represents the type of triangle
    - to be valid:
      - all angles must be greater than 0
      - sum of angles must be 180
    - right: one angle = 90
    - acute: all 3 angles < 90
    - obtuse: one angle > 90

EXAMPLES

DATA STRUCTURES
- input: three integers
  - array of all three angles
- output: symbol

ALGORITHM
- create an array of all three input integers
- if sum does not == 180 or any angle <= 0, return :invalid
- consider the largest angle
  - if > 90, then return :obtuse
  - if == 90, then return :right
  - if < 90, then return :acute
=end

# def triangle(angle1, angle2, angle3)
#   angles = [angle1, angle2, angle3]
#   return :invalid unless angles.sum == 180 && angles.min > 0
#   case angles.max
#   when (1..89) then :acute
#   when 90 then :right
#   when (91..) then :obtuse
#   end
# end

# p triangle(60, 70, 50) == :acute
# p triangle(30, 90, 60) == :right
# p triangle(120, 50, 10) == :obtuse
# p triangle(0, 90, 90) == :invalid
# p triangle(50, 50, 50) == :invalid


### 5 TRIANGLE SIDES
=begin
A triangle is classified as follows:

    equilateral All 3 sides are of equal length
    isosceles 2 sides are of equal length, while the 3rd is different
    scalene All 3 sides are of different length

To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

PROBLEM
input: 3 integers
  - represent lengths of sides of a potential triangle
output: symbol
  - represents what kind of triangle the input integers represent
    - :equilateral
      - all three sides are equal lengths
    - :isosceles
      - two sides are equal lengths, one is differentt
    - :scalene
      - all sides are different lengths
    - :invalid
      - any side length is not greater than 0
      - sum of two shortest sides must be > length of longest side

EXAMPLES

DATA STRUCTURES
- input: 3 integers
  - array of all 3 integers
    - sorted so that can determine two shortest sides
- output: symbol

ALGORITHM
- Determine if triangle is valid
  - create an array of the three input integers
  - sort from smallest to largest
  - check if all integers are  greater than 0
  - check if sum of first two integers in array is greater than last integer
    - return :invalid if either condition is not met
- Determine type of triangle
  - if all integers are the same: return :equilateral
  - if two are the same and the third is different, return :isosceles
  - if all are different, return :scalene
=end

# def triangle(side1, side2, side3)
#   all_sides = [side1, side2, side3].sort
#   return :invalid unless valid?(all_sides)
#   return :equilateral if equilateral?(all_sides)
#   return :isosceles if isosceles?(all_sides)
#   :scalene
# end

# def valid?(sides)
#   sides.all? { |side| side > 0 } &&
#   sides.first(2).sum > sides.last
# end

# def equilateral?(sides)
#   side1, side2, side3 = sides
#   side1 == side2 && side2 == side3
# end

# def isosceles?(sides)
#   side1, side2, side3 = sides
#   (side1 == side2 && side1 != side3) ||
#   (side2 == side3 && side1 != side2) ||
#   (side1 == side3 && side1 != side2)
# end

# p triangle(3, 3, 3) #== :equilateral
# p triangle(3, 3, 1.5) #== :isosceles
# p triangle(3, 4, 5) #== :scalene
# p triangle(0, 3, 3) #== :invalid
# p triangle(3, 1, 1) #== :invalid



### 4 MATCHING PARENTHESES
=begin
Write a method that takes a string as an argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

Note that balanced pairs must each start with a (, not a ).

PROBLEM
input: string

output: boolean
  - return true if all parentheses in input string are 'balanced'
    - same number of '(' and ')' characters
    - balanced pairs must start with a '('
    - if no parentheses in input string, string is 'balanced'

EXAMPLES

DATA STRUCTURES
- needs:
  - a way to determine 'balance'

- input: string
  - array of individual characters in input string
  - counter to track balance
    - start at 0
    - increment or decrement for each ( or )
- output: boolean

ALGORITHM
- set a balance counter to 0
- create an array of individual characters in the input string
- for each character:
  - ignore unless it is ( or )
  - increment counter if (
  - decrement counter if )
  - return false if counter is ever less than 0
- return true if counter == 0 at end, false otherwise
=end

# def balanced?(string)
#   balance = 0
#   string.chars.each do |character|
#     balance += 1 if character == '('
#     balance -= 1 if character == ')'
#     break if balance < 0
#   end
#   balance == 0
# end


# p balanced?('What (is) this?') == true
# p balanced?('What is) this?') == false
# p balanced?('What (is this?') == false
# p balanced?('((What) (is this))?') == true
# p balanced?('((What)) (is this))?') == false
# p balanced?('Hey!') == true
# p balanced?(')Hey!(') == false
# p balanced?('What ((is))) up(') == false
# p balanced?('What ())(is() up') == false


### 3 LETTERCASE PERCENTAGE
=begin
In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, as well as characters that were neither of those two. Now we want to go one step further.

Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.

7:17
PROBLEM
input: string
  - will always contain at least one character (i.e. no empty strings)
  - may contain lowercase, uppercase and non-alpha characters

output: hash
  - keys: symbols: lowercase, uppercase, neither
    - neither = non-alpha characters
    - spaces count (as neither)
  - values: floats percentage of that type of charcter in input string

EXAMPLES

DATA STRUCTURES
needs:
  - length of input string
  - number of each type of character
    - way to identify type of character
      - array of all lowercase alpha characters
      - array of all uppercase alpha characters
- input: string
  - array of individual characters in string
- output: hash

ALGORITHM
- create an array of all lowercase alpha characters
- create an array of all uppercase alpha characters
- create an empty hash with a default value of

- convert input string into an array of individual characters
- for each character in the input string
  - increment the appropriate value in the hash
- transform the hash values into percentages
  - divide the count by the length of the input string (as a float)
- return the hash

=end
# def letter_percentages(string)
#   {
#     lowercase: percentage(string, 'a-z'),
#     uppercase: percentage(string, 'A-Z'),
#     neither: percentage(string, '^A-Za-z')
#   }
# end

# def letter_percentages(string)
#   percentages = { lowercase: 'a-z', uppercase: 'A-Z', neither: '^A-Za-z' }
#   percentages.transform_values { |target| percentage(string, target) }
# end

# def percentage(string, target)
#   (string.count(target) / string.size.to_f * 100 ).round(1)
# end

###
# def letter_percentages(string)
#   counts = counts(string)
#   percentages(string, counts)
# end

# def counts(string)
#   {
#     lowercase: string.count('a-z'),
#     uppercase: string.count('A-Z'),
#     neither: string.count('^A-Za-z')
#   }
# end

# def percentages(string, counts)
#   counts.transform_values { |count| (count * 100.0 / string.size).round(1) }
# end
###

### ESTHER HO
# def letter_percentages(string)
#   percentages = { lowercase: 'a-z', uppercase: 'A-Z', neither: '^a-zA-Z' }

#   percentages.transform_values do |range|
#     (string.count(range) * 100.0 / string.size).round(1)
#   end
# end
###

# p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
# p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
# p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
# p letter_percentages('abcdefGHI') == {:lowercase=>66.7, :uppercase=>33.3, :neither=>0.0}


### 2 ABCs
=begin
A collection of spelling blocks has two letters per block, as shown in this list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

'boxkdqcpnagtrefsjwhuvilyzm'

This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each letter in each block can only be used once.

Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.

PROBLEM
input: string
  - contains only alpha characters
    - upper and lower case
output: boolean
  - true if string can be constructed from 'blocks', false otherwise
    - each block contains two characters (one on each side)
      - a particular block can only be used once
        - therefore no repeats of the same letter
        - if letter on one side of a block has been used, letter on other side cannot be
  - case insensitive
    - e.g. 'b' == 'B'

EXAMPLES

DATA STRUCTURES
-needs:
  - a way to represent the blocks
  - a way to determine if a particular block has been used

- input: string
  - array to represent blocks
    - each element is a two letter string # ['bo', 'xk', 'dq', . . .]
  - array of each letter in downcased input string # ['b', 'a', 't', 'c', 'h']
  - count of how many times each element in blocks array includes each letter in input string
- output: boolean
  - false if count is greater than 1 for any block

ALGORITHM
- create a representation of the blocks
  - array of thirteen elements
    - each element is a two-letter string
- determine how many times each block is used to create the input string
  - for each block in blocks array
    - consider each letter in input string
    - if letter occurs in that block, increase count by 1
- return false if any block is used more than once, true otherwise
=end

# BLOCKS = %w(bo xk dq cp na gt re fs jw hu vi ly zm)

# def block_word?(word)
#   letters = word.downcase.chars
#   counts = BLOCKS.map do |block|
#     letters.count { |letter| block.include?(letter) }
#   end
#   counts.all? { |count| count < 2 }
# end

# def block_word?(word)
#   letters = word.downcase.chars
#   BLOCKS.each do |block|
#     return false if (letters.count { |letter| block.include?(letter) }) > 1
#   end
#   true
# end

# def block_word?(word)
#   BLOCKS.none? { |block| word.downcase.count(block) > 1 }
# end

# p block_word?('BATCH') #== true
# p block_word?('BUTCH') #== false
# p block_word?('jest') #== true
# p block_word?('apple') #== false
# p block_word?('Baby') #== false


### 1 LONGEST SENTENCE
=begin
Write a program that reads the content of a text file and then prints the longest sentence in the file based on number of words. Sentences may end with periods (.), exclamation points (!), or question marks (?). Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word. You should also print the number of words in the longest sentence.

The longest sentence in the below text is the last sentence; it is 86 words long. (Note that each '--' counts as a word.)

Another Example

Download the book at http://www.gutenberg.org/cache/epub/84/pg84.txt, and run your program on this file.

The longest sentence in this book is 157 words long.

Hint: f you have a variable str that contains a bunch of sentences, you can split into an array of sentences like this:

  sentences = text.split(/\.|\?|!/)

PROBLEM
input: string (text file)
  - contains sentences
    - sentence: string that ends with  . ! ?
      - word: sequence of contiguous non-space, non-sentence-ending characters

output: string, integer
  - string is longest sentence of input string
    - longest = greatest number of words
  - integer is number of words in that sentence

needs:
- way to divide text into sentences
- way to determine longest sentence
  - way to count number of words in each sentence

EXAMPLES

DATA STRUCTURES
- input: string
  - array of individual sentences
  - array of individual words in each sentence
- output: string, integer

ALGORITHM
- divide input string into individual sentences
- find the longest sentence
  - divide each sentence into individual words
  - select the sentence with the most words
- output longest sentence to terminal
- output number of words in that sentence to terminal

=end

# def longest_sentence(text)
#   sentences = text.split(/\.|\?|!/)
#   longest = sentences.max_by { |sentence| sentence.split.size }.strip
#   puts longest
#   puts longest.split.size
# end

# def longest_paragraph(text)
#   paragraphs = text.split(/\n\n/)
#   longest = paragraphs.max_by { |paragraph| paragraph.split.size }.strip
#   puts longest
#   puts longest.split.size
# end

# def longest_word(text)
#   words = text.split
#   longest = words.max_by { |word| word.size }
#   puts longest
#   puts longest.size
# end

# text = File.read('frankenstein.txt')

# text = "Four score and seven years ago our fathers brought forth on this continent a new nation, conceived in liberty, and dedicated to the proposition that all men are created equal.

# Now we are engaged in a great civil war, testing whether that nation, or any nation so conceived and so dedicated, can long endure. We are met on a great battlefield of that war. We have come to dedicate a portion of that field, as a final resting place for those who here gave their lives that that nation might live. It is altogether fitting and proper that we should do this.

# But, in a larger sense, we can not dedicate, we can not consecrate, we can not hallow this ground. The brave men, living and dead, who struggled here, have consecrated it, far above our poor power to add or detract. The world will little note, nor long remember what we say here, but it can never forget what they did here. It is for us the living, rather, to be dedicated here to the unfinished work which they who fought here have thus far so nobly advanced. It is rather for us to be here dedicated to the great task remaining before us -- that from these honored dead we take increased devotion to that cause for which they gave the last full measure of devotion -- that we here highly resolve that these dead shall not have died in vain -- that this nation, under God, shall have a new birth of freedom -- and that government of the people, by the people, for the people, shall not perish from the earth."

# longest_paragraph(text)

### 9.2 BUBBLE SORT AGAIN
=begin
Write a method that takes an Array as an argument, and sorts that Array using the bubble sort algorithm as just described. Note that your sort will be "in-place"; that is, you will mutate the Array passed as an argument. You may assume that the Array contains at least 2 elements.

PROBLEM 7:27
input: array
  - elements are all the same type (presumably)
    - integers
    - strings
    - presumably any other sortable objects
output: same array
  - sorted (smallest to largest) using bubble sort
    - sorted by making multiple passes through collection
      - on each pass, each subsequent pair of elements is compared
        - swapped if element 1 is larger than element 2
      - once no swaps have been made on a pass, return the array

EXAMPLES

DATA STRUCTURES
needs:
  - way to consider each subsequent pair of elements
    - way to keep track of place in collection
  - way to know when to stop iterations and return array
    - way to keep track of whether a swap was made on a particular round

start: array
  - outer loop: control number of passes through array
    - boolean to track whether a swap was made
  - inner loop: control one pass through the array
    - range to represent start and stop indexes
end: same array

ALGORITHM
- start outer loop to control number of passes through input array
  - create a variable to track swaps: `no_swaps`
  - set `no_swaps` to `true`

    - start inner loop to control each pass through input array
      - create a range to track current index
        - from 0 up to (array length - 2)
        - for each index
          - compare elements at index and index + 1
          - if 1st element is greater than 2nd
            - swap elements
            - set `no_swaps` to `false`

  - break from outer loop if `no_swaps` is still `true`

- return the sorted array

=end

### basic
# def bubble_sort!(list)
#   loop do
#     no_swaps = true

#     (0..(list.size - 2)).each do |index|
#       if list[index] > list[index + 1]
#         swap_elements!(list, index)
#         no_swaps = false
#       end
#     end

#     break if no_swaps
#   end

#   list
# end

# def swap_elements!(list, index)
#   list[index], list[index + 1] = list[index + 1], list[index]
# end

### optimized 1
# def bubble_sort!(list)
#   offset = 2

#   loop do
#     no_swaps = true

#     last_index = list.size - offset
#     (0..last_index).each do |index|
#       if list[index] > list[index + 1]
#         swap_elements!(list, index)
#         no_swaps = false
#       end
#     end

#     break if no_swaps
#     offset += 1
#   end

#   list
# end

# def swap_elements!(list, index)
#   list[index], list[index + 1] = list[index + 1], list[index]
# end

### optimized 2
def bubble_sort!(list)
  last_swap = list.size - 1

  loop do


    last_index = list.size - offset
    (0..last_index).each do |index|
      if list[index] > list[index + 1]
        swap_elements!(list, index)
        no_swaps = false
      end
    end

    break if no_swaps
    offset += 1
  end

  list
end

def swap_elements!(list, index)
  list[index], list[index + 1] = list[index + 1], list[index]
end

array1 = [5, 3]
bubble_sort!(array1)
p array1 #== [3, 5]

array2 = [6, 2, 7, 1, 4]
bubble_sort!(array2)
p array2 #== [1, 2, 4, 6, 7]

array3 = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array3)
p array3 #== %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

### 9 BUBBLE SORT
=begin
Write a method that takes an Array as an argument, and sorts that Array using the bubble sort algorithm as just described. Note that your sort will be "in-place"; that is, you will mutate the Array passed as an argument. You may assume that the Array contains at least 2 elements.

PROBLEM 4:05
input: array
  - elements can be integers, strings (prob any sortable object)
  - will always contain at least two elements
output: same array
  - in sorted order

EXAMPLES

DATA STRUCTURES
needs:
  - way to keep track of current pair to compare
  - way to swap places of elements
  - way to tell if no swaps have been made
- start: array
  - variable to track if a swap has been made this iteration: boolean
  - variable to track current index
  - loop
  - break condition: swaps_made = false
- end: same array

2 loops:
  - array loop
  - comparison loop

ALGORITHM
- start outer loop (iterate over whole array)
  - set an index variable to 0
  - set a variable `swaps_made_this_round` to false

  - start inner loop (compare two elements)
    - break if index == array.size - 1
    - compare elements at current index and index + 1

      - if 1st element is less than or equal to 2nd element
        - increment index

      - elsif 2nd element is greater than 1st element
        - swap the places of these elements
        - set swaps_made_this_round to true
        - increment index



  - break if `swaps_made_this_round` is false

- return array

=end

# def bubble_sort!(array)
#   loop do
#     index = 0
#     swaps_made_this_round = false

#     loop do
#       break if index >= array.size - 1

#       if array[index] > array[index + 1]
#         array[index], array[index + 1] = array[index + 1], array[index]
#         swaps_made_this_round = true
#       end
#       index += 1
#     end

#     break if swaps_made_this_round == false
#   end

#   array
# end

# ###
# def bubble_sort!(array)
#   loop do
#     swaps_made_this_round = false
#     last_index = array.size - 2

#     (0..last_index).each do |index|
#       if array[index] > array[index + 1]
#         array[index], array[index + 1] = array[index + 1], array[index]
#         swaps_made_this_round = true
#       end
#     end

#     break if swaps_made_this_round == false
#   end

#   array
# end

# ####
# def bubble_sort!(array)
#   offset = 2
#   loop do
#     swaps_made_this_round = false
#     last_index = array.size - offset

#     (0..last_index).each do |index|
#       if array[index] > array[index + 1]
#         array[index], array[index + 1] = array[index + 1], array[index]
#         swaps_made_this_round = true
#       end
#     end
#     offset += 1
#     break if swaps_made_this_round == false
#   end

#   array
# end

####
# def bubble_sort!(array)
#   last_index = array.length - 1

#   until last_index == 0
#     last_swap = 0

#     (0..(last_index - 1)).each do |index|
#       if array[index] > array[index + 1]
#         array[index], array[index + 1] = array[index + 1], array[index]
#         last_swap = index
#       end
#     end

#     last_index = last_swap
#   end

#   array
# end

###
# def bubble_sort!(array)
#   last_index = array.length

#   until last_index == 0
#     last_swap = 0

#     (1..(last_index - 1)).each do |index|
#       if array[index - 1] > array[index]
#         array[index - 1], array[index] = array[index], array[index - 1]
#         last_swap = index
#       end
#     end

#     last_index = last_swap
#   end

#   array
# end

###
# def bubble_sort!(array)
#   loop until array.each_cons(2).with_index.none?{ |(e1,e2),i| array[i],array[i+1] = e2, e1 if e1 > e2 }
# end

# def bubble_sort!(array)
#   until array.each_cons(2).all? { |ele1, ele2| ele2 > ele1 }
#     array.each_cons(2).with_index do |(ele1, ele2), index|
#       if ele1 > ele2
#         array[index], array[index + 1] = array[index + 1], array[index]
#       end
#     end
#   end
# end

# def bubble_sort!(array)
#   until array.each_cons(2).all? { |ele1, ele2| ele2 > ele1 }
#     array.each_cons(2).with_index do |(ele1, ele2), idx|
#       array[idx], array[idx + 1] = array[idx + 1], array[idx] if ele1 > ele2
#     end
#   end
# end

# array1 = [5, 3]
# bubble_sort!(array1)
# p array1 == [3, 5]

# array2 = [6, 2, 7, 1, 4]
# bubble_sort!(array2)
# p array2 == [1, 2, 4, 6, 7]

# array3 = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# bubble_sort!(array3)
# p array3 == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

### 8 FEATURED NUMBERS
=begin
A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Return an error message if there is no next featured number.

PROBLEM 12:24
input: integer

output: integer, or string
  - integer: next 'featured' number greater than input integer
    - odd
    - multiple of 7
    - no duplicate digits
  - string: 'There is no possible number that fulfills those requirements'
    - if no greater featured number

EXAMPLES

DATA STRUCTURES
needs:
  - maximum featured number
    - last odd multiple of 7 before 9_876_543_210 with no duplicate digits
  - way to count up from input integer to next featured number
  - way to determine if a number is featured

- start: integer
  - ranger from input integer up to max featured number
- end: integer or error message

ALGORITHM
- return error message if input integer is >= max featured number
- create a constant for the max featured number
- create a range from input integer up to max featured number
- return the first number from the range that is a featured number
- if no number found, return error message
=end

# MAX_FEATURED_NUMBER = 9_876_543_201

# def featured(number)
#   return no_solution_message if number >= MAX_FEATURED_NUMBER
#   next_featured_number(number)
# end

# def no_solution_message
#   'There is no possible number that fulfills those requirements'
# end

# def next_featured_number(number)
#   start = find_next_odd_multiple_of_seven(number + 1)
#   (start..MAX_FEATURED_NUMBER).step(14).find { |num| unique_digits?(num) }
# end

# def find_next_odd_multiple_of_seven(number)
#   number += number.odd? ? 0 : 1
#   (number..(number + 14)).step(2).find { |num| num % 7 == 0 }
# end

# def unique_digits?(number)
#   seen_digits = Array.new(10, false)
#   loop do
#     number, current_digit = number.divmod(10)
#     return false if seen_digits[current_digit]
#     seen_digits[current_digit] = true
#     break if number == 0
#   end
#   true
# end

# p featured(12) == 21
# p featured(20) == 21
# p featured(21) == 35
# p featured(997) == 1029
# p featured(1029) == 1043
# p featured(999_999) == 1_023_547
# p featured(999_999_987) == 1_023_456_987

# p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

### 7FE FIVE FRIDAYS
=begin
An interesting variation on this problem is to count the number of months that have five Fridays. This one is harder than it sounds since you must account for leap years.

PROBLEM 8:17
input: integer
  - represents a year
  - Gregorian calendar (> 1752, assume no future changes)
output: integer
  - represents number of months in that year that have 5 fridays

EXAMPLES

DATA STRUCTURES
needs:
  - way to consider every month
  - way to determine number of fridays in that month
    - way to find first friday in a given month
    - way to get all remaining fridays in that month
  - way to account for leap years

start: integer (year)
  - range 1 to 12 (months)
  - range 1 to 7 to find first Friday of that month
  - range from first Friday date up to 31, stepping by 7
end: integer (number of 5-friday months)

ALGORITHM
- require 'date'
- create a range to represent months, from 1 to 12
- for each month
  - consider every number from 1 to 31
    - convert it into a date
    - select date if it's a Friday AND a valid date
- select the month if the array of Fridays == 5
- return the size of the 5-Friday months array
=end
# require 'date'

# def five_friday_months(year)
#   (1..12).count { |month| fridays_in_month(year, month) == 5 }
# end

# def fridays_in_month(year, month)
#   (1..31).count { |day| valid_friday?(year, month, day) }
# end

# def valid_friday?(year, month, day)
#   Date.valid_date?(year, month, day) && Date.new(year, month, day).friday?
# end

###
# require 'date'

# def five_friday_months(year)
#   (1..12).count { |month| fridays_in_month(year, month) == 5 }
# end

# def fridays_in_month(year, month)
#   first_friday = get_first_friday(year, month)
#   (first_friday..31).step(7).count { |day| Date.valid_date?(year, month, day) }
# end

# def get_first_friday(year, month)
#   (1..7).find { |day| Date.new(year, month, day).friday? }
# end
###

# p five_friday_months(2015) == 4
# p five_friday_months(1986) == 4
# p five_friday_months(2019) == 4
# p five_friday_months(2021) == 5

### 7 UNLUCKY DAYS
=begin
Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.

PROBLEM 8:03
input: integer
  - represents a year
  - > 1752
output: integer
  - represents number of Friday the 13ths in that year

EXAMPLES

DATA STRUCTURES
needs:
  - way to examine every month's 13th day
  - way to determine if that day is a Friday

start: integer (year)
  - range from 1 to 12 (months)
end: integer (number of Friday the 13ths)

ALGORITHM
- create a counter to track number of Friday the 13ths
- iterate over a range from 1 to 12
  - for each month, create a new Date object: Date.new(input integer, month, 13)
  - increment counter if that day is a Friday
- return the counter
=end

# def friday_13th(year)
#   (1..12).count { |month| Time.new(year, month, 13).friday? }
# end

# p friday_13th(2015) == 3
# p friday_13th(1986) == 1
# p friday_13th(2019) == 2

### 6 TRI-ANGLES
=begin
A triangle is classified as follows:

    right: One angle of the triangle is a right angle (90 degrees)
    acute: All 3 angles of the triangle are less than 90 degrees
    obtuse: One angle is greater than 90 degrees.

To be a valid triangle, the sum of the angles must be exactly 180 degrees, and all angles must be greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the 3 angles of a triangle as arguments, and returns a symbol :right, :acute, :obtuse, or :invalid depending on whether the triangle is a right, acute, obtuse, or invalid triangle.

You may assume integer valued angles so you don't have to worry about floating point errors. You may also assume that the arguments are specified in degrees.

PROBLEM 7:16
input: 3 integers
  - represent the angles, in degrees, of a potential triangle

output: symbol
  - represent:
    - whether its a valid triangle:
      - sum of angles must == 180 AND
      - all angles must be > 0
      - if not valid, return :invalid
    - if valid, return type of triangle:
      - right: one angle is 90
      - acute: all angles < 90
      - obtuse: one angle is > 90

EXAMPLES

DATA STRUCTURES
- needs:
  - way to determine if triangle is valid
    - sum of angles == 180
    - all angles > 0
  - way to determine type of triangle
    - largest angle

- start: 3 integers
  - sum of angles
  - smallest angle
  - largest angle
- end: symbol

[:right, :obtuse, :acute]

ALGORITHM
- determine whether valid triangle
  - return :invalid unless:
    - sum of all angles == 180
    - smallest angle > 0
- determine type of triangle
  - compare largest angle to 90
    - if less than, :acute
    - if equal to, :right
    - if greater than, :obtuse
=end

# def triangle(angle1, angle2, angle3)
#   angles = [angle1, angle2, angle3]
#   valid_triangle?(angles) ? type_of_triangle(angles) : :invalid
# end

# def valid_triangle?(angles)
#   angles.sum == 180 && angles.min > 0
# end

# def type_of_triangle(angles)
#   types = [:right, :obtuse, :acute]
#   index = angles.max <=> 90
#   types[index]
# end

# p triangle(60, 70, 50) == :acute
# p triangle(30, 90, 60) == :right
# p triangle(120, 50, 10) == :obtuse
# p triangle(0, 90, 90) == :invalid
# p triangle(50, 50, 50) == :invalid

### 5 TRIANGLE SIDES
=begin
A triangle is classified as follows:

    equilateral: All 3 sides are of equal length
    isosceles: 2 sides are of equal length, while the 3rd is different
    scalene: All 3 sides are of different length

To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

PROBLEM 1:38
input: 3 integers
  - represent lengths of three sides of a potential triangle
  - can be 0
  - assume all will be either 0 or positive
output: symbol
  - either:
    - type of triangle: equilateral, isosceles, scalene
      - equilateral: all three sides are the same length
      - isosceles: two sides are equal lengths, one side is different
      - scales: no sides are of equal length
  - or:
    - invalid:
      - sum of lengths of 2 shortest sides is less than length of longest side
        OR
        - length of any side is not > 0

EXAMPLES

DATA STRUCTURES
needs:
  - way to determine validity
    - way to determine two shortest sides
  - if valid, way to determine type
    - way to compare all sides and determine if 0 or 2 or 3 lengths are equal

- start: 3 integers
  - sorted array of the 3 integers
- end: symbol

ALGORITHM
- determine if valid
  - create an array of all 3 sides, and sort it, smallest to largest
  - return :invalid unless first element is > 0
  - return :invalid unless first element + second element > third element
- determine type
  - get count of how many sides equal the first element
  - if 1, then return :scales
  - if 2, then return :isoscales
  - if 3, th# def triangle(side1, side2, side3)
#   sides = [side1, side2, side3]
#   valid_triangle?(sides) ? triangle_type(sides) : :invalid
# end

# def valid_triangle?(sides)
#   sides.min(2).sum > sides.max
# end

# def triangle_type(sides)
#   number_of_equal_sides = sides.tally.values.max
#   case number_of_equal_sides
#   when 3 then :equilateral
#   when 2 then :isosceles
#   when 1 then :scalene
#   end
# end

# def triangle_type(sides)
#   types = %i(isosceles scalene equilateral)
#   number_of_equal_sides = sides.tally.values.max
#   index = 2 <=> number_of_equal_sides
#   types[index]
# end

# def triangle_type(sides)
#   types = %i(zero scalene isosceles equilateral)
#   number_of_equal_sides = sides.tally.values.max
#   types[number_of_equal_sides]
# end

# p triangle(3, 3, 3) == :equilateral
# p triangle(3, 3, 1.5) == :isosceles
# p triangle(3, 4, 4) == :isosceles
# p triangle(3, 4, 5) == :scalene
# p triangle(0, 3, 3) == :invalid
# p triangle(3, 1, 1) == :invalid

### 4 PARENTHESES
=begin
Write a method that takes a string as an argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

Note that balanced pairs must each start with a (, not a ).

PROBLEM 10:15
input: string

output: boolean
  - true if all parentheses in input string are 'balanced'
    - matching pairs: ( )
      - must start with a (, not a )
    - true if no parentheses in input string
  - false otherwise

EXAMPLES

DATA STRUCTURES
needs:
  - way to make sure every ( has a matching )
  - way to make sure a pair starts with (

- start: string
  - array of individual character in input string
  - counter to track matching status
    - +1 if ( is encountered
    - -1 if ) is encountered
- end: boolean
  - true if counter equals zero at end
  - false if counter is ever less than 0
  - false if counter does not equal 0 at end

ALGORITHM
- create a counter variable and set it to 0
- for every character in the input string
  - if it is a '(', add 1 to the counter
  - if it is a ')', subtract 1 from the counter
  - return `false` if counter is < 0
  - otherwise go to next character
- return true if counter == 0
- return false otherwise

=end

# def balanced?(string)
#   balance = 0
#   string.each_char do |char|
#     next unless ['(', ')'].include?(char)
#     balance += (char == '(' ? 1 : -1)
#     break if balance < 0
#   end
#   balance.zero?
# end

# p balanced?('What (is) this?') #== true
# p balanced?('What is) this?') == false
# p balanced?('What (is this?') == false
# p balanced?('((What) (is this))?') == true
# p balanced?('((What)) (is this))?') == false
# p balanced?('Hey!') == true
# p balanced?(')Hey!(') == false
# p balanced?('What ((is))) up(') == false
# p balanced?('What ())(is() up') == false

### 3 LETTERCASE %
=begin
Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.

PROBLEM 6:38
input: string
  - may contain uppercase, lowercase, and non-letter characters
  - will always contain at least one character
output: hash
  - keys are symbols
    - :lowercase, :uppercase, :neither
  - values are floats
    - percentages of that type of character in input string
    - formatted / rounded to 1 decimal place

EXAMPLES

DATA STRUCTURES
- needs:
  - way to distinguish different types of characters
  - way to keep count of each type
  - way to determine percentage
  - way to correctly format percentage

- start: string
  - array of all uppercase letters
  - array of all lowercase letters
  - empty hash with default value of 0
  - array of individual characters in input string
- end: hash

ALGORITHM
- get the occurrences of each type in the input string
  - create two arrays of all alphabetic characters: uppercase and lowercase
  - create an empty hash with a default value of 0: counts
  - for each character in the input string
    - if it is included in the uppercase array
      - increment counts[:uppercase]
    - if it is included in the lowercase array
      - increment counts[:lowercase]
    - otherwise
      - increment counts[:neither]
- convert counts to percentages
  - for each value in the counts hash
    - divide by the length of the input string (result should be float)
    - round to one decimal place
=end

# def letter_percentages(string)
#   types = %i(lowercase uppercase neither)
#   selectors = %w(a-z A-Z ^A-Za-z)
#   percentages = types.zip(selectors).to_h

#   # percentages.map do |type, selector|
#   #   [type, (string.count(selector).fdiv(string.size) * 100).round(1)]
#   # end.to_h

#   percentages.transform_values do |selector|
#     (string.count(selector).fdiv(string.size) * 100).round(1)
#   end
# end

###
# def letter_percentages(string)
#   percentages = { lowercase: 'a-z', uppercase: 'A-Z', neither: '^A-Za-z' }
#   percentages.transform_values { |selector| percentage(string, selector) }
# end

# def percentage(string, selector)
#   (string.count(selector).fdiv(string.size) * 100).round(1)
# end

# p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
# p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
# p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
# p letter_percentages('abcdefGHI') == {:lowercase=>66.7, :uppercase=>33.3, :neither=>0.0}


### 2 BLOCKS
=begin
A collection of spelling blocks has two letters per block, as shown in this list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each letter in each block can only be used once.

Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.

PROBLEM 4:39
input: string

output: boolean
  - true if string can be made using the blocks
    - only one of each letter pair can be used in the string
    - case doesn't matter
  - false otherwise

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

EXAMPLES

DATA STRUCTURES
- needs:
  - way to enforce using only one of a given pair

- start: string 'BATCH'
  - array of 'blocks' [BO XK DQ . . .]
    - each block is a string with two letters
  - array of counts of how many times a block is used
    - if current input string letter is on a particular block
- end: boolean

ALGORITHM
- create an array of 'blocks'
  - each element is a two-character string
- for each block in array
  - for each character in that block
    - count how many times it appears in the upcased string
  - return false if the count is > 1
- return true otherwise
=end

# BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)

# def block_word?(word)
#   BLOCKS.all? { |block| word.upcase.count(block) < 2 }
# end

# p block_word?('BATCH') == true
# p block_word?('BUTCH') == false
# p block_word?('jest') == true

### 11 FIBONACCI PATTERN
=begin
PROBLEM 12:32
input: integer
  - represents a place in the fibonacci series
- output: integer
  - last digit of number in that place

EXAMPLES

DATA STRUCTURES
needs:
  - way to detect a pattern in last digit
    - keep adding last digits to an array
    - compare front and back half of array
    - stop when they are equal

  - way to use that pattern to quickly determine last digit
    - get modulo of input integer by that pattern size
    - return digit at that index

- start: integer
  - array of all last digits in fibonacci series before it starts to repeat
  - get modulo of input integer by pattern size
  - return digit at that index from last digits array
- output: integer

ALGORITHM
Pattern Finder:
  - create a last_digits array: [1, 1]
  - set a counter at 3
  - start a loop
    - get the last digit of the fibonacci series for counter number
    - add it to last_digits
    - increment counter
    - break if first half of last_digits equals last half
  - return half of last_digits

Digit Finder
  - get the modulo of dividing input integer by last_digits.size
  - return the digit at that index in last_digits
=end

# def fibonacci_last(nth)
#   pattern = pattern_finder
#   place = (nth % pattern_finder.size) - 1
#   pattern[place]
# end

# def pattern_finder
#   last_digits = [1, 1]
#   nth = 3

#   loop do
#     last_digits << find_last_digit(nth)
#     nth += 1
#     half = last_digits.size / 2
#     break if last_digits.take(half) == last_digits.drop(half)
#   end

#   last_digits.take(last_digits.size / 2)
# end

# def find_last_digit(nth)
#   (3..nth).inject([1, 1]) do |last_two, _|
#     [last_two.last, last_two.sum].map { |num| num % 10 }
#   end.last
# end

# p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
# p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
# p fibonacci_last(100)       # -> 5
# p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
# p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
# p fibonacci_last(123456789) # -> 4
# p fibonacci_last(123_456_789_987_745) # -> 5

### 10 FIBONACCI III
=begin
PROBLEM 12:16
input: integer
  - represents place in the fibonacci series
output: integer
  - final digit of fibonacci number in that place

EXAMPLES

DATA STRUCTURES
- needs:
  - way to get last digit of a number

- start: integer
  - last digit of previous two fib numbers
- finish: integer

ALGORITHM
- create an array for the previous two fib digits: [1, 1]
- for every number from 3 up to the input integer
  - get % 10 of both fib digits
  - last_two[0], last_two[1] = last_two[1], last_two.sum
- return the last_two array
=end

# def fibonacci_last(nth)
#   last_two = [1, 1]
#   (3..nth).each do |place|
#     last_two[0], last_two[1] = last_two[1], last_two.sum
#     last_two.map! { |num| num % 10 }
#   end
#   last_two.last
# end

# p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
# p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
# p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
# p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
# p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
# p fibonacci_last(123456789) # -> 4

### 9 FIBONACCI II
=begin
PROBLEM 7:44
input: integer

output: integer
  - if input integer <= 2, return 1
  - else sum of previous two numbers in series

EXAMPLES

DATA STRUCTURES
- needs:
  - way to keep track of last two numbers in series
  - way to keep track of current place in series

- start: integer
  - array of last two numbers in series
    - starts at [1, 1] for place 3
- finish: integer

ALGORITHM
- return 1 if input integer is <= 2
- create an array, `last_two`, to hold last two numbers: [1, 1]
- create a range from 3 up to input integer
  - for each iteration
    - last_two[0], last_two[1] = last_two[1], (last_two[0] + last_two[1])
- return the last element of `last_two`
=end

# def fibonacci(nth)
#   return 1 if nth <= 2
#   last_two = [1, 1]
#   (3..nth).each do |_|
#     last_two[0], last_two[1] = last_two[1], (last_two[0] + last_two[1])
#   end
#   last_two.last
# end

# p fibonacci(20) == 6765
# p fibonacci(100) == 354224848179261915075
# p fibonacci(100_001) # => 4202692702.....8285979669707537501


### 8 FIBONACCI I
# def fibonacci(nth)
#   return 1 if nth <= 2
#   fibonacci(nth - 1) + fibonacci(nth - 2)
# end

# p fibonacci(1) == 1
# p fibonacci(2) == 1
# p fibonacci(3) == 2
# p fibonacci(4) == 3
# p fibonacci(5) == 5
# p fibonacci(12) == 144
# p fibonacci(20) == 6765

### LETTER POSITIONS
=begin
Consider the word "abode".
The letter `a` is in position 1 and `b` is in position 2.
In the alphabet, `a` and `b` are also in positions 1 and 2.

The letters `d` and `e` in "abode" occupy the positions they would occupy in the alphabet, which are positions 4 and 5.

Given an array of words, return an array of the number of letters that occupy their positions in the alphabet for each word.

PROBLEM 6:35
input: array
  - elements are 'words'
    - strings of contiguous characters
    - all alphabetic
    - uppercase and lowercase
    - not empty
output: array
  - elements are integers
  - same number of elements as input array
  - integer is the number of letters in the word that occupy their positions in the alphabet
    - a = 1, b = 2, etc
    - can be 0
  - case doesn't matter: a = 1, A = 1

EXAMPLES

DATA STRUCTURES
- needs:
  - way to determine if a letter in in its alphabet position
  - way to keep count number of such letters

- start: array of strings
  - array of alphabetic characters in order, plus a 0 on the front
  - array of individual characters in each string
  - array of characters that are in alphabet position
  - size of that array
- finish: array of integers

ALGORITHM
- create an array of all lowercase alphabetic characters in order
  - prepend a '0'
- for each string in the input array
  - create an empty array: counts
  - create an array of individual characters in the string
  - select only those characters that are in their alphabet position
    - if index of that character in alphabet array equals index in characters array
  - get the size of this array, and add it to the counts array
- return the counts array
=end

# ALPHABET = ('a'..'z').to_a

# def solve(strings)
#   strings.map do |string|
#     get_alphabet_position_letters(string)
#   end
# end

# def get_alphabet_position_letters(string)
#   string.chars.select.with_index do |char, index|
#     ALPHABET.index(char.downcase) == index
#   end.size
# end

# p solve(["abode", "ABc", "xyzD"]) == [4, 3, 1]
# p solve(["abide", "ABc", "xyz"]) == [4, 3, 0]
# p solve(["IAMDEFANDJKL", "thedefgh", "xyzDEFghijabc"]) == [6, 5, 7]
# p solve(["encode", "abc", "xyzD", "ABmD"]) == [1, 3, 1, 3]

### DECODER
=begin
We're receiving a set of messages in code. The messages are sets of text strings, like:
"alakwnwenvocxzZjsf"
Write a method to decode these strings into numbers. The decoded number should be the number of lowercase characters between the first two uppercase characters. If there aren't two uppercase characters, the number should be 0.

PROBLEM 4:31
input: array
  - elements are text strings
    - can contain upper and lowercase letters
    - strings can be empty
  - array can be empty
output: array
  - elements are integers
    - number of lowercase characters between first two uppercase characters in input strings
    - if not two uppercase characters in input string, then 0
  - if input array is empty, return empty array

EXAMPLES

DATA STRUCTURES
- needs:
  - way to determine number of uppercase letters
  - way to determine locations (indexes) of uppercase letters
  - way to determine number of lowercase characters between first two uppercase characters
    - (index 2 - index 1) - 1

- start: array
  - array of all uppercase alphabet characters
  - array of indexes of uppercase charcters
- finish: array

ALGORITHM
- Create an empty array to hold results
- Find the indexes of all uppercase characters in each input string
  - create an array of all uppercase alphabetical characters
  - create an empty array to store indexes
  - convert each input string into an array of individual characters
  - get the indexes of every character that is uppercase
  - store them in the indexes array
- if there are two or more indexes in the indexes array
  - get the difference between the second and the first, and substract 1
  - add this number to the results array
- otherwise, add 0 to the results array
=end
# UPPERCASE = ('A'..'Z').to_a

# def decode(strings)
#   uppercase_indexes = get_uppercase_indexes(strings)
#   get_codes(uppercase_indexes)
# end

# def get_uppercase_indexes(strings)
#   strings.map do |string|
#     string.chars.each_index.select { |index| UPPERCASE.include?(string[index]) }
#   end
# end

# def get_codes(array)
#   array.map { |indexes| indexes.size < 2 ? 0 : (indexes[1] - indexes[0]) - 1 }
# end

# p decode(['ZoL', 'heLlo', 'XX']) == [1, 0, 0]
# p decode(['foUrsCoreAnd', 'seven', '']) == [2, 0, 0]
# p decode(['lucYintheskyWith', 'dIaMonDs']) == [8, 1]
# p decode([]) == []

### LETTER COUNT ***
=begin
Write a method that takes a string as an argument and returns a hash containing the number of times each character present in the string occurs. The input string wil contain only alphabetic lowercase characters, and no spaces.

The hash keys should be symbols, and should be in alphabetical order, not order of appearance in the input string. The hash values should be the number of occurrences of the letter represented by the symbol.

PROBLEM 4:42
input: string
  - will contain only alphabetic lowercase characters
  - no spaces
output: hash
  - contains the number of times each character present in input string occurs
  - keys are symbols
    - letters (as symbols)
    - should be in alphabetical order, NOT order of appearance in input string
  - values are integers
    - number of times that letter is present

EXAMPLES

DATA STRUCTURES
- needs:
  - way to count occurrences of each letter
  - way to keep or put hash keys in alphabetical order

- start: string
  - array of all letter characters in alphabetical order
  - empty hash to store counts in (default value of 0)
  - conditional to see whether a given letter occurs in input string
- finish: hash

ALGORITHM
- create an array of all lowercase alphabetic characters in alphabetical order
- create an empty hash with a default value of 0
- iterate over this array
  - if current letter is present in input string
  - create a key for that letter
    - value will be the number of occurrences of that letter in input string
- return the hash
=end

# ALPHABET = ('a'..'z').to_a

# def letter_count(string)
#   counts = Hash.new(0)
#   ALPHABET.each do |letter|
#     if string.include?(letter)
#       counts[letter.to_sym] = string.count(letter)
#     end
#   end
#   counts
# end

# p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
# p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
# p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

### MAX SUM ***
=begin
Write a method that takes an array containing 0 or more integers and returns the maximum sum of a contiguous sequence of integers from that array.

The contiguous sequence can range from 0 elements up to all elements of the input array. A sequence with 0 elements in it should be considered to have a sum of 0.

PROBLEM 4:19
input: array
  - contains 0 or more integers
    - integers can be positive or negative
  - can be empty
output: integer
  - maximum sum of a conitguous sequence of integers from input array
    - sequence can be from 0 elements up to full length of input array
    - treat a sequence of 0 elements as having a sum of 0
    - if input array is empty, return 0

EXAMPLES

DATA STRUCTURES
- needs:
  - way to generate all possible sequences
  - way to sum sequences
  - way to find maximum sum
  - way to handle 0 length sequences

- start: array
  - array of all possible sequences
    - from index 0 up to last index
    - from length 0 up to (array length - current index)
  - array of sums
- finish: integer (largest sum)

ALGORITHM
- create an array of all possible substrings from input array
  - create an empty array to store sequences
  - start at index 0, up to index (array length - 1)
  - start from length 0, up to length (array length - current index)
- transform sequences array into an array of sums
- return the highest sum
=end

# def max_sum(array)
#   sequences = get_sequences(array)
#   sums = sequences.map(&:sum)
#   sums.max
# end

# def get_sequences(array)
#   sequences = []
#   last_index = array.size - 1

#   (0..last_index).each do |start_index|
#     max_length = array.size - start_index
#     (1..max_length).each do |length|
#       sequences << array[start_index, length]
#     end
#   end

#   sequences << []
# end

# p max_sum([]) == 0
# p max_sum([1, 2, 3]) == 6
# p max_sum([-1, -2, -3]) == 0
# p max_sum([1, 2, 3, -1]) == 6
# p max_sum([1, -1, 2, 3, -1, 2]) == 6
# p max_sum([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6 # [4, -1, 2, 1]

### SUBSTRING TWICE ***
=begin
Write a method that takes two strings and returns true if there exists a substring that appears in both of them. Return false otherwise. Only consider substrings that are at least two characters in length. Disregard case (for example, 'ace' and 'Ace' would be considered the same substring).

All input strings will contain at least two characters, and will not contain any spaces.

PROBLEM 12:42
input: two strings
  - contain at least two characters
  - will not contain any spaces
output: boolean
  - return true if:
    - a common substring appears in both input strings
      - substring must be at least two characters
      - substring can be entire input string
      - disregard case: 'ace' and 'Ace' are considered same substring
  - return false otherwise

EXAMPLES

DATA STRUCTURES
- needs:
  - way to obtain all possible substrings from first input string (length >= 2)
  - way to determine if second input string contains at least one of those substrings

- start: two strings
  - array of all >=2 length substrings from first input string
- finish: boolean

ALGORITHM
- get all possible substrings from first input string (lenght >= 2)
  - start at index 0, up to index (string length - 2)
  - start at length 2, up to length (string length - current index)
- determine whether any of those substrings occur in second input string
  - check if any substrings are included in second input string
    - return true if so, false otherwise
=end

# def substring_twice?(string1, string2)
#   substrings = get_substrings(string1)
#   substrings.any? { |substring| string2.downcase.include?(substring) }
# end

# def get_substrings(string)
#   substrings = []
#   last_index = string.size - 2

#   (0..last_index).each do |start_index|
#     max_length = string.size - start_index

#     (2..max_length).each do |length|
#       substrings << string.downcase[start_index, length]
#     end
#   end
#   substrings
# end

# p substring_twice?('face', 'Ace') #== true
# p substring_twice?('face', 'ACTUALLY') #== true
# p substring_twice?('face', 'gave') #== false
# p substring_twice?('aa', 'aa') #== true

### LONGEST ALPHABETICAL ***
=begin
Write a method that takes a string containing only lowercase letters as an argument, and returns the longest substring that is in alphabetical order. If there are multiple solutions, return the substring that occurs first in the input string. All input strings will be at least one character in length.

PROBLEM 12:37
input: string
  - contains only lowercase letters
  - always at least length 1
output: string
  - longest substring of input string that is in alphabetical order
  - if more than one, return earliest
  - can be entire input string

EXAMPLES

DATA STRUCTURES
- needs
  - way to obtain all possible substrings
    - start at index 0, up to last index
    - start at length 1, up to input string length
  - way to determine if a substring is in alphabetical order
    - substring to array of individual letters
    - letters sorted compared to original order

- start: string
  - array of all possible substrings
  - array of only alphabetical substrings
- finish: longest alphabetical string

ALGORITHM
- get all possible substrings
  - create an empty array to hold substrings
  - add substrings
    - from index 0 up to index (length - 1)
     - from length 1 up to input string length
- find all alphabetical substrings
  - convert each substring to an array of individual characters
  - compare this array to a sorted version of itself
    - keep if they are equal
- return longest alphabetical substring
=end

# def longest(string)
#   all_substrings = get_all_substrings(string)
#   alphabetical_substrings = get_alphabetical_substrings(all_substrings)
#   alphabetical_substrings.max_by(&:size)
# end

# def get_all_substrings(string)
#   all_substrings = []
#   last_index = string.size - 1

#   (0..last_index).each do |start_index|
#     max_length = string.size - start_index

#     (1..max_length).each do |length|
#       all_substrings << string[start_index, length]
#     end
#   end

#   all_substrings
# end

# def get_alphabetical_substrings(substrings)
#   substrings.select { |substring| alphabetical?(substring) }
# end

# def alphabetical?(string)
#   string.chars == string.chars.sort
# end

# p longest('abc') == 'abc'
# p longest('abcace') == 'abc'
# p longest('asd') == 'as'
# p longest('nab') == 'ab'
# p longest('abcdeapbcdef') ==  'abcde'
# p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
# p longest('asdfbyfgiklag') == 'fgikl'
# p longest('z') == 'z'
# p longest('zyba') == 'z'

### ALPHABET SCORE ***
=begin
Write a method that takes a string of words as an argument and returns the word that scores highest according to the letters it contains. Each letter of a word scores points according to its position in the alphabet: a = 1, b = 2, etc. So, for example, the word "ace" has a score of 9 (1 + 3 + 5).

If two words are tied for highest score, return the word that appears earliest in the original string.

You can assume that all letters in the input string are lowercase and all input strings are valid.

PROBLEM 10:04
input: string
  - contains 'words'
    - sequence of contiguous characters separated by whitespace
  - all letters are lowercase
  - all input strings are valid

output: string
  - the word from input string that
    - has highest 'letter score'
      - each letter has a score according to its position in alphabet
        - a = 1, b = 2, etc
      - score of word is sum of scores of all its letters
    - if two or more words have same score, return earliest word

EXAMPLES

DATA STRUCTURES
- needs:
  - way to separate input string into words
  - way to assess score of each letter
  - way to calculate score of each word
  - way to resolve ties / successfully return earliest word

- start: string
  - array of alphabetic characters in order (for scoring)
    - add non-letter character to front so indexes match scores
  - array of individual words
  - transformed array: [word, word score]
- finish: string

ALGORITHM
- create an array of lowercase alphabetic characters in order
  - add '0' to the front of the array
- create a helper method to determine the score of a word
  - convert word to an array of separate characters
  - transform array into letter scores
    - use index of current letter in alphabet array
  - return the sum
- convert input string into an array of separate words
  - get the word with the highest letter score, using the helper method
=end

# ALPHABET = ('a'..'z').to_a.prepend('0')

# def alphabet_score(words)
#   words.split.max_by { |word| word_score(word) }
# end

# def word_score(word)
#   word.chars.map { |char| ALPHABET.index(char) }.sum
# end

# p alphabet_score('time is up') == 'time'
# p alphabet_score('time to stop') == 'stop'
# p alphabet_score('aced up') == 'up'
# p alphabet_score('ebb ace') == 'ebb'
# p alphabet_score('c ba') == 'c'

### DELETE A DIGIT ***
=begin
Write a method that takes an integer as an argument and returns the largest integer that can be obtained by deleting exactly one digit.

Assume all input integers will contain at least two digits

PROBLEM 6:41
input: integer
  - will always contain at least two digits

output: integer
  - largest value that can be obtained by deleting one digit from input integer
  - digits stay in order

EXAMPLES

DATA STRUCTURES
- needs:
  - way to create all possible 'sub-integers'
    - input integer with one digit deleted
    '12345' => [
    '2345', # => 0: x,      1..4,
    '1345', # => 1: 0..0    2..4
    '1245', # => 2: 0..1,   3..4
    '1235'  # => 3: 0..2,   4..4
    '1234'  # => 4: 0..3,   x
    ]


- start: integer
  - array of all possible sub-integers
    - integers converted to strings or arrays of digits
    - substrings concatenated minus specific digit
- finish: integer

ALGORITHM
- find all possible integers with one digit deleted from input integer
  - create an array to hold values
  - convert input integer into a string
  - for each index in the string
    - convert string into an array of individual characters
    - delete the character at the current index
    - convert the array into a string then into an integer
    - store it in the array

- return the largest
=end

# def delete_digit(number)
#   results = []
#   last_index = number.to_s.size - 1

#   (0..last_index).each do |index|
#     digits = number.to_s.chars
#     digits.delete_at(index)
#     results << digits.join.to_i
#   end

#   results.max
# end

# def delete_digit(number)
#   last_index = number.to_s.size - 1

#   (0..last_index).map do |index|
#     digits = number.to_s.chars
#     digits.delete_at(index)
#     digits.join.to_i
#   end.max
# end

# p delete_digit(10) == 1
# p delete_digit(12) == 2
# p delete_digit(123) == 23
# p delete_digit(321) == 32
# p delete_digit(12345) == 2345
# p delete_digit(62345) == 6345
# p delete_digit(791983) == 91983
# p delete_digit(1001) == 101

### REPEATED SUBSTRING ***
=begin
Write a method that takes a string as an argument and returns true if that string can be constructed by taking a substring and concatenating two or more copies of the substring together. Return false otherwise.

PROBLEM 5:14
input: string
  - can contain any type of character
    - upper and lower case

output: boolean
  - return true if:
    - input string can be constructing by taking a substring and
      - concatenating 2 or more copies of substring together
    - case matters: 'abcABC' == false
    - min substring size is 1
    - max substring size is (input string length / 2)
  - return false otherwise

EXAMPLES

DATA STRUCTURES
- needs
  - way to generate appropriate substrings
    - size 1 up to size length/2
  - way to determine if 2 or more copies of substring == input string
    - substring must be an even multiple of string length
  - list of multiples of string length?
    - or current multiplier: input string length / current substring length

- start: string
  - array of substrings
  - multiplier
- finish: boolean

ALGORITHM
- generate eligible substrings from input string
  - start at size 1, up to (input string length / 2)
  - start at index 0, up to (string length - current size)
  - select only unique substrings
- test if any unique eligible substrings can construct input string
  - multiplier = input string length / substring length
  - does substring * multiplier equal input string?
  - return true if yes for any substring
  - false otherwise
=end

# def repeated_substring(string)
#   substrings = get_substrings(string)
#   substrings.any? do |substring|
#     multiplier = string.size / substring.size
#     substring * multiplier == string
#   end
# end

# def get_substrings(string)
#   substrings = []
#   max_size = string.size / 2
#   (1..max_size).each do |current_size|
#     last_index = string.size - current_size
#     (0..last_index).each do |start_index|
#       substrings << string[start_index, current_size]
#     end
#   end
#   substrings.uniq
# end

# p repeated_substring('aba') == false
# p repeated_substring('aaa') == true
# p repeated_substring('abab') == true
# p repeated_substring('abcABC') == false
# p repeated_substring('AabAaba') == false
# p repeated_substring('aB@AbaB@Ab') == true
# p repeated_substring('ab3ab3ab3') == true

### TRIPLE DOUBLE ***
=begin
Write a method that takes two integers as arguments and returns true if the first integer has a sequence of at least three in a row of the same number, and the second integer has a sequence of at least two in a row of that same number. Otherwise, return false.

PROBLEM 7:57
input: two integers

output: boolean
  - true if 1st input integer has sequence of at least 3 in a row of same number
    - AND 2nd input integer has a sequence of at least 2 in a row of same number
    - triple and double must be same numbers
  - false otherwise

EXAMPLES

DATA STRUCTURES
- needs:
  - way to determine triples / doubles
  - way to store target digit so that triple number == double number

- start: two integers
  - string representations of integers
  - all 3 or 2 character substrings from each
  - matching numbers
- finish: boolean

ALGORITHM
- get all 3 or 2 digit sequences from each input integer
  - convert integer to a string
  - from each index up to (length - target length)
    - get sequence of target length
  - store in an array
- from sequences array, get all sequences with identical digits
  - all digits must equal each other
- from identicals array, get all unique digits
  - iterate over a range (0..9)
    - select only digits that appear in identicals array
- compare unique digits arrays
  - return true if they contain matching digit(s)
  - false otherwise
=end

# def triple_double(number1, number2)
#   sequences1 = get_sequences(number1, 3)
#   sequences2 = get_sequences(number2, 2)

#   triples = get_multiples(sequences1)
#   doubles = get_multiples(sequences2)

#   unique_digits1 = get_unique_digits(triples)
#   unique_digits2 = get_unique_digits(doubles)

#   unique_digits1.any? { |digit| unique_digits2.include?(digit) }
# end

# def get_sequences(number, target_size)
#   last_index = number.to_s.size - target_size
#   (0..last_index).map { |start_index| number.to_s[start_index, target_size] }
# end

# def get_multiples(sequences)
#   sequences.select do |sequence|
#     digits = sequence.chars
#     digits.all? { |digit| digit == digits[0] }
#   end
# end

# def get_unique_digits(multiples)
#   multiples.map { |multiple| multiple.chr }
# end

# p triple_double(12345, 12345) == false
# p triple_double(1222345, 122345) == true
# p triple_double(1222345, 123345) == false
# p triple_double(666789, 12345666) == true
# p triple_double(451999277, 41177722899) == true

### SORTING
=begin
Write a method that takes two sorted Arrays as arguments, and returns a new Array that contains all elements from both arguments in sorted order.

You may not provide any solution that requires you to sort the result array. You must build the result array one element at a time in the proper order.

Your solution should not mutate the input arrays.

PROBLEM 6:25
input: 2 arrays
  - arrays are in sorted order
  - can be empty

output: array
  - contains all elements of both input arrays, in sorted order
  - input arrays are not mutated
  - if either input array is empty, result is same as the other array

EXAMPLES

DATA STRUCTURES
- needs:
  - way to consider each element of each array
  - way to determine which element to add next to result array
  - way to deal with different-sized input arrays
  - way to deal with empty input arrays?

- start: two arrays
  - empty array to add elements to
  - counters to track current index in each array
  - loop to control iterations / flow
  - conditional to deal with different sized arrays, 'leftovers'
- finish: array

ALGORITHM
- create an empty array to hold results
- create two counters, one for each array, to track current index
  - start at 0
- start a loop
  - break when one of the index counters equals the length of its array
  - examine elements at current index from both arrays
    - if one is <= to the other
      - add that element to the results array
      - increment that array's index counter

- add all remaining elements to the results array
  - if index is <= to length of its array
    - add remaining elements from that array
      - from current index to end of array

- return the results array
=end

# def merge(array1, array2)
#   result = []
#   index1 = 0
#   index2 = 0

#   loop do
#     break if index1 == array1.size || index2 == array2.size
#     if array1[index1] <= array2[index2]
#       result << array1[index1]
#       index1 += 1
#     else
#       result << array2[index2]
#       index2 += 1
#     end
#   end

#   result += array1[index1..-1] if index1 <= index1.size
#   result += array2[index2..-1] if index2 <= index2.size

#   result
# end

###
# def merge(array1, array2)
#   result, index1, index2 = merge_equal_parts(array1, array2)
#   result + array1[index1..-1] + array2[index2..-1]
# end

# def merge_equal_parts(array1, array2)
#   result = []
#   index1 = 0
#   index2 = 0

#   until index1 == array1.size || index2 == array2.size
#     if array1[index1] <= array2[index2]
#       result << array1[index1]
#       index1 += 1
#     else
#       result << array2[index2]
#       index2 += 1
#     end
#   end

#   [result, index1, index2]
# end

# p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
# p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
# p merge([], [1, 4, 5]) == [1, 4, 5]
# p merge([1, 4, 5], []) == [1, 4, 5]

### CLOSEST VALUES ***
=begin
Write a method that takes an array of integers as an argument and returns the
two numbers that are closest together in value. If more than one pair of integers satisfies this condition, return the pair whose elements occurs first in the input array.

PROBLEM 7:27
input: array
  - contains numbers
  - always contains at least three numbers
output: array
  - pair of numbers that are closest together in value
    - if more than one pair qualifies, return earliest pair
    - paired numbers are not necessarily contiguous

EXAMPLES

DATA STRUCTURES
- needs:
  - way to compare all numbers with each other
  - way to find closest pair

- start: array
  - array containing all possible pairs as subarrays
    - [12, 7, 17] => [[12, 7], [12, 17], [7, 17]]
      - don't need to consider duplicate pairs (e.g. [17, 7])
      - start at index 0, end at index (length - 2)
      - [array[0], array[1]], [array[0], array[2]], [array[1], array[2]]
  - pairs array sorted by difference between two elements
- finish: array

ALGORITHM
- create an array of pair subarrays
  - create a range to represent starting indexes:
    - from 0 up to (array length - 2)
    - for each starting index, pair with numbers at indexes:
      - (index + 1) up to (array length - 1)
- return the pair with the smallest difference between them

=end

# def closest_numbers(numbers)
#   pairs = get_pairs(numbers)
#   pairs.min_by { |pair| pair.inject(:-).abs }
# end

# def get_pairs(numbers)
#   pairs = []
#   last_start_index = numbers.size - 2
#   last_index = numbers.size - 1

#   (0..last_start_index).each do |index1|
#     next_index = index1 + 1
#     (next_index..last_index).each do |index2|
#       pairs << [numbers[index1], numbers[index2]]
#     end
#   end

#   pairs
# end

# p closest_numbers([2, 4, 6, 7]) == [6, 7]
# p closest_numbers([5, 15, 25, 11, 20]) == [15, 11]
# p closest_numbers([3, 6, 8, 11, 13]) == [6, 8]
# p closest_numbers([12, 7, 17]) == [12, 7]

### MULTIPLY ALL PAIRS ***
=begin
Write a method that, given two arrays each containing lists of numbers, returns a new array that contains the product of every pair of numbers that can be formed between the elements of the two arrays. The results should be sorted by increasing value.

You may assume that neither argument is an empty array.

PROBLEM 8:57
input: two arrays
  - arrays are not empty
  - arrays contain only numbers

output: new array
  - elements are the products of every pair of numbers that can be formed between elements of two input arrays
  - sorted from lowest to highest
  - number of elements is product of the sizes of input arrays

EXAMPLES

DATA STRUCTURES
- needs:
  - way to multiply each element of one array by every element of other
  - way to sort resulting array

- start: two arrays

- end: array

ALGORITHM
- create an empty array: products
- consider each element of first array
  - multiply by each element of second array
  - add products to products array
- sort products array lowest to highest
- return products array
=end

# def multiply_all_pairs(array1, array2)
#   products = []
#   array1.each do |num1|
#     array2.each { |num2| products << (num1 * num2) }
#   end
#   products.sort
# end

# p multiply_all_pairs([3], [1, 3, 2]) == [3, 6, 9]
# p multiply_all_pairs([1, 2], [3, 4]) == [3, 4, 6, 8]
# p multiply_all_pairs([1, 2], [4, 3, 1, 2]) == [1, 2, 2, 3, 4, 4, 6, 8]

### NEXT BIGGEST NUMBER ***
=begin
Write a method that, given a positive integer, returns the next biggest number that can be formed from the same digits. If no bigger number can be formed from those digits, return -1

PROBLEM 10:32
input: integer
  - positive

output: integer
  - next biggest number that can be formed from same digits
  - OR -1 if no bigger number can be formed
    - if input integer is only 1 digit, e.g. 9
    - if input integer contains all the same digit, e.g. 111
    - if input integer is already the largest possible number with those digits, e.g. 21

EXAMPLES

DATA STRUCTURES
- needs:
  - way to find numbers with same digits as input integer /
    - way to determine if a number has all the same digits as input integer
  - way to determine if such a number is the NEXT biggest number from input integer
  - way to determine largest possible number using those digits

- start: integer
  - largest possible number
    - array of individual digits
    - reverse sorted array of those digits
    - string => integer
  - range from (input integer + 1) to largest possible number
  - arrays of individual digits, sorted (to compare to each other)
- end: integer

ALGORITHM
- create an integer that is the maximum possible number using the same digits as the input integer
  - create an array of individual digits
  - sort them in reverse numerical order
  - convert to a string
  - convert to an integer
- find the next largest number with all the same digits
  - create a range: (input integer + 1) up to maximum possible number
  - consider each number in the range in turn
  - return the first number that uses all the same digits as input integer
    - convert input integer and candidate integer into arrays of digits
    - sort both arrays
    - compare them to each other
- if no such number found, return -1
=end

# def next_bigger_num(number)
#   start_number = number + 1
#   max_number = find_max_number(number)

#   next_bigger = (start_number..max_number).find do |candidate|
#     same_digits?(number, candidate)
#   end

#   next_bigger || -1
# end

# def find_max_number(number)
#   number.digits.sort.reverse.join.to_i
# end

# def same_digits?(number, candidate)
#   number.digits.sort == candidate.digits.sort
# end

# p next_bigger_num(9) == -1
# p next_bigger_num(12) == 21
# p next_bigger_num(315) == 351
# p next_bigger_num(111) == -1
# p next_bigger_num(13579) == 13597
# p next_bigger_num(13573) == 13735
# p next_bigger_num(13576) == 13657
# p next_bigger_num(97531) == -1

### PAIRS ***
=begin
Write a function that takes an array as an argument, and returns an array with pairs of elements grouped into subarrays. The first element should be paired with the last, the second element with the second to last, etc.

If the array has an odd number of elements, repeat the middle element twice for the final pair.

PROBLEM 5:20
input: array
  - can be empty
  - can contain only one element

output: array
  - elements are subarrays
  - each subarray contains a pair of elements from the input array
    - first element from input array paired with last
    - second with second to last
    - etc
      - if input array has an odd number of elements:
        - repeat middle element twice for final pair
  - if input array is empty, return empty array

EXAMPLES

DATA STRUCTURES
- needs:
  - way to control size of output array / number of iterations
    - length / 2 if even
    - length / 2 + 1 if odd
    - (length + 1) / 2 ***
  - way to select proper elements to go into each subarray
    - 1st and last, 2nd and 2nd to last, etc
      - indexes: 0 & -1, 1 & -2, 2 & -3

- start: array
  - range: 0 up to (length + 1) / 2
  - transformed range
    - current index, -(current index + 1)
- end: array

ALGORITHM
- create a range from 0 up to (input array length + 1) / 2
- transform this range into an array:
  - each range element becomes a subarray
    - current range number = index
    - each array contains:
      - element at index, element at -(index + 1)
- return this transformed array
=end

# def pairs(array)
#   last_index = (array.size - 1) / 2
#   (0..last_index).map do |index|
#     [array[index], array[-(index + 1)]]
#   end
# end

# def pairs(array)
#   iterations = (array.size + 1) / 2
#   iterations.times.map do |index|
#     [array[index], array[-(index + 1)]]
#   end
# end

# p pairs([1, 2, 3, 4, 5, 6]) == [[1, 6], [2, 5], [3, 4]]
# p pairs([1, 2, 3, 4, 5]) == [[1, 5], [2, 4], [3, 3]]
# p pairs([1, 2]) == [[1, 2]]
# p pairs([1]) == [[1, 1]]
# p pairs([]) == []

### VOWEL SUBSTRINGS ***
=begin
Write a method that takes a string as an argument and returns the number of "vowel substrings" within it. A "vowel substring" is a contiguous sequence of characters within the input string that consists only of vowels ('a', 'e', 'i', 'o', and 'u') and has all five vowels present in it at least once. All input strings will contain only lowercase letters.

PROBLEM 6:05
input: string
  - contains only lowercase letters
  - not empty?
output: integer
  - number of 'vowel substrings' in input string
    - vowel substrings:
      - only vowels, no other characters
      - all five vowels (aeiou) appear at least once
      - order not important
      - minimum length is 5

EXAMPLES

DATA STRUCTURES
- needs:
  - way to get candidate substrings
  - way to determine if only vowels are present
  - way to determine if all vowels are present at least once

start: string
  - string of all vowels: 'aeiou'
  - array of all substrings of length 5 or greater
  - array of substrings that only contain vowels
  - array of substrings that contain all vowels at least once
end: integer

ALGORITHM
- get all substrings of at least length 5
  - starting indexes: 0 up to input string length - 5
  - length: 5 up to length of input string
- select substrings that have only vowels
- select substrings that contain all 5 vowels
  - iterate over each vowel
  - only select strings for which each vowel is present at least once

=end

# def count_vowel_substrings(string)
#   vowels = 'aeiou'
#   all_substrings = get_all_substrings(string)
#   vowels_only_substrings = get_vowels_only_substrings(all_substrings, vowels)
#   vowel_substrings = get_vowel_substrings(vowels_only_substrings, vowels)
#   vowel_substrings.size
# end

# def get_all_substrings(string)
#   last_index = string.size - 5
#   max_length = string.size
#   (0..last_index).each_with_object([]) do |start_index, substrings|
#     (5..max_length).each do |length|
#       substrings << string[start_index, length]
#     end
#   end
# end

# def get_vowels_only_substrings(substrings, vowels)
#   substrings.select do |substring|
#     substring.chars.all? { |char| vowels.include?(char) }
#   end
# end

# def get_vowel_substrings(vowels_only, vowels)
#   vowels_only.select do |substring|
#     vowels.chars.all? { |vowel| substring.include?(vowel) }
#   end
# end

# p count_vowel_substrings('abcde') == 0
# p count_vowel_substrings('aeiou') == 1
# p count_vowel_substrings('iaoue') == 1
# p count_vowel_substrings('aeiogu') == 0
# p count_vowel_substrings('aeiouu') == 2
# p count_vowel_substrings('aeiouuu') == 3
# p count_vowel_substrings('aaeeiioouu') == 5

### LETTER CHANGES ***
=begin
Write a method that takes a string as an argument and returns a new string with every letter character replaced with the 3rd letter following it in the alphabet ('a' becomes 'd', 'b' becomes 'e', etc).

Maintain the case of the original letter. Loop back to the beginning of the alphabet if the 3rd letter is past the end ('x' becomes 'a', 'Y' becomes 'B', etc). Leave any non-letter characters unchanged.

PROBLEM 6:17
input: string
  - may contain uppercase and lowercase letters
  - may contain non-letter characters

output: new string
  - every letter character is replaced:
    - by the 3rd letter following it in the alphabet
      - maintain case
      - loop back to beginning if 3rd letter is past the end
        - 'xyz' => 'abc'
  - non-letter characters are unchanged
  - contains same number of characters as input string

EXAMPLES

DATA STRUCTURES
- needs:
  - way to determine if a character is alphabetic
  - way to determine character to change alpha characters into
    - way to 'loop' if past end of alphabet

- start: string
  - array of all alphabetic characters
    - add A, B, and C to end of uppercase (for looping purposes)
    - add a, b, and c to end of lowercase (for looping purposes)
    - can use indexes to account for shift
  - array of individual characters
  - transformed array
- end: string

ALGORITHM
- create an array of all alphabetic characters in order
  - uppercase: add 'A', 'B', and 'C' to end
  - lowercase: add 'a', 'b', and 'c' to end
= convert the input string into an array of individual characters
- for each character in input string:
  - if it is included in the alphabet array, transform it
    - get the index of that character in the alphabet array
      - add 3 to the index
      - use this new index to return the appropriate character
  - otherwise leave as is
- convert transformed array into a string and return it
=end

# uppercase = ('A'..'Z').to_a * 2
# lowercase = ('a'..'z').to_a * 2
# SHIFT_ALPHABET = uppercase + lowercase
# ALPHABET_SIZE = 26

# def letter_changes(string, shift_size = 3)
#   string.chars.map do |char|
#     SHIFT_ALPHABET.include?(char) ? shift(char, shift_size) : char
#   end.join
# end

# def shift(character, shift_size)
#   shift_size %= ALPHABET_SIZE
#   new_index = SHIFT_ALPHABET.index(character) + shift_size
#   SHIFT_ALPHABET[new_index]
# end

# p letter_changes('abc', -23) == 'def'
# p letter_changes('WxY') == 'ZaB'
# p letter_changes('364.39') == '364.39'
# p letter_changes("JaneDoe37@gmail.com") == 'MdqhGrh37@jpdlo.frp'

### SMALLER THAN CURRENT ***
=begin
Write a method that takes an array of numbers as an argument. For each number in the input array, determine how many other numbers in the array are less than that current number. Return these results in an array.

When counting how many numbers are less than the current number, only consider unique values. If a given number occurs more than once in the array, it should only be counted once.

PROBLEM 5:58
input: array
  - contains only integers
  - can contain only one element
  - will not be empty?
output: array
  - for each integer element in input array:
    - element in output array represents:
      - how many other numbers are less than that current number
        - only consider unique values
        - can be 0
  - contains same number of elements as input array

EXAMPLES

DATA STRUCTURES
- needs:
  - way to compare each element to other elements
  - way to exclude non-unique values

- start: array [1 1 2 3]
  - array of unique values from input array [1 2 3]
- end: array [0 0 1 2]

ALGORITHM
- create an array of unique values in the input array
- transform each value in input array
  - compare it to all values in unique array
    - select unique values that are less than current input array value
    - get the size of that array
- return the transformed array
=end

# def smaller_than(array)
#   uniques = array.uniq
#   array.map { |number| less_thans(number, uniques).size }
# end

# def less_thans(number, unique_values)
#   unique_values.select { |value| number > value }
# end

# p smaller_than([1, 2]) == [0, 1] # 0 numbers are less than 1, 1 number is less than 2
# p smaller_than([1, 200]) == [0, 1]
# p smaller_than([1, 1, 2, 2]) == [0, 0, 1, 1]
# p smaller_than([1, 1, 2, 3]) == [0, 0, 1, 2]
# p smaller_than([8, 1, 2, 3]) == [3, 0, 1, 2]
# p smaller_than([7, 7, 7]) == [0, 0, 0]
# p smaller_than([1]) == [0]


### SUBSTRING COUNT ***
=begin
Write a method that takes two strings as arguments and returns the number of times the second input string occurs as a substring within the first input string. Both input strings will consist solely of lowercase letters, and will always be at least one character in length.

PROBLEM 4:43
input: 2 strings
  - contain only lowercase letters
  - always at least length 1 / never empty
output: integer
  - number of times 2nd input string occurs as a substring in 1st input string
  - can be 0

EXAMPLES

DATA STRUCTURES
- needs:
  - way to find substrings in larger string
  - way to keep count of substrings

- start: 2 strings
  - array of all substrings in first input string
    - of same length as second input string
  - filtered array of matching substrings
- end: integer

ALGORITHM
- find the length of the second input string: length2
- find all substrings of that length from the first substring
  - start at index 0
  - end at index (length1 - length2)
  - length = length1
- find substrings from that group that match second input string
- return the number of those substrings
=end

# def count_substrings(string1, string2)
#   substrings = get_substrings(string1, string2.size)
#   substrings.select { |substring| substring == string2 }.size
# end

# def get_substrings(string, length)
#   last_index = string.size - length
#   (0..last_index).map do |start_index|
#     string[start_index, length]
#   end
# end

# p count_substrings('abcdeb','b') == 2
# p count_substrings('cc', 'cc') == 1
# p count_substrings('abbcbb', 'bb') == 2
# p count_substrings('abcdef', 'gh') == 0
# p count_substrings('aaaaa', 'aa') == 4

# p 'abbcbb'.count('bb')


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

# MAX_FEATURED_NUMBER = 9_876_543_201

# def featured(number)
#   return error_message if number >= MAX_FEATURED_NUMBER
#   starting_number = find_next_odd_multiple_of_seven(number + 1)
#   next_featured_number(starting_number)
# end

# def error_message
#   'There is no possible number that fulfills those requirements'
# end

# def find_next_odd_multiple_of_seven(number)
#   number += 1 until number.odd? && number % 7 == 0
#   number
# end

# def next_featured_number(starting_number)
#   (starting_number..MAX_FEATURED_NUMBER).step(14).each do |number|
#     return number if unique_digits?(number)
#   end
# end

# def unique_digits?(number)
#   seen_digits = Array.new(10, false)
#   loop do
#     number, current_digit = number.divmod(10)
#     return false if seen_digits[current_digit]
#     seen_digits[current_digit] = true
#     break if number == 0
#   end
#   true
# end

# def unique_digits?(number)
#   number.to_s.chars == number.to_s.chars.uniq
# end

# def unique_digits?(number)
#   digits = ('0'..'9').to_a
#   string_num = number.to_s
#   digits.all? do |digit|
#     string_num.count(digit) < 2
#   end
# end

# p featured(12) == 21
# p featured(20) == 21
# p featured(21) == 35
# p featured(997) == 1029
# p featured(1029) == 1043
# p featured(999_999) == 1_023_547
# p featured(999_999_987) == 1_023_456_987

# p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

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

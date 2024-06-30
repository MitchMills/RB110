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

NUMERICS = ('0'..'9').to_a

def sum_of_numbers(string)
  numeric_strings = get_numeric_strings(string)
  integers = numeric_strings.map(&:to_i)
  integers.sum
end

def get_numeric_strings(string)
  numeric_strings = []
  num_string = ''

  string.each_char do |char|
    if NUMERICS.include?(char)
      num_string << char
    else
      numeric_strings << num_string unless num_string.empty?
      num_string = ''
    end
  end

  numeric_strings << num_string unless num_string.empty?
  numeric_strings
end

p sum_of_numbers("L12aun3ch Sch3oo451") == 469
p sum_of_numbers("HE2LL3O W1OR5LD") == 11
p sum_of_numbers("The30quick20brown10f0x1203jumps914ov3r1349the102l4zy dog") == 3635

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

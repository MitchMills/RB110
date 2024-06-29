### TWO
=begin
Create a method that takes an array of integers as an argument. The method should return the minimum sum of 5 consecutive numbers in the array. If the array contains fewer than 5 elements, the method should return nil.
=end

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, -5]) == 9
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

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

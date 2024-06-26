### 10.3 MUTATION
array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = array1.map(&:dup)
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
p array2

### 9.3 INCLUDED?
=begin
Write a method named include? that takes an Array and a search value as arguments. This method should return true if the search value is in the array, false if it is not. You may not use the Array#include? method in your solution.

PROBLEM 11:11
input: array, search value (can be any object)
  - array can be empty
  - search value can be any object, including nil

output: boolean
  - true if search value occurs in input array
  - false otherwise
  - return false if input array is empty

EXAMPLES

DATA STRUCTURES
- needs
  - way to consider each value in input array
  - way to compare each value to search value

- input: array, object

- output: boolean

ALGORITHM
- consider each element in the input array
  - compare it to the search value
    - return true if they are the same
  - return false if no element is the same as the search value
=end
# def include?(array, target)
#   array.any?(target)
# end

# p include?([1,2,3,4,5], 3) == true
# p include?([1,2,3,4,5], 6) == false
# p include?([], 3) == false
# p include?([nil], nil) == true
# p include?([], nil) == false

### 8.3 DUPLICATES
=begin
Given an unordered array and the information that exactly one value in the array occurs twice (every other value occurs exactly once), how would you determine which value occurs twice? Write a method that will find and return the duplicate value that is known to be in the array.

PROBLEM 10:44
input: array
  - elements are not in any particular order
  - contains one and only one duplicate value
  - all integers?
output: integer
  - the duplicate value

EXAMPLES

DATA STRUCTURES
- needs
  - way to consider each value
  - way to detect duplicate

- input: array
  - empty array to add non-duplicate values to
- output: integer

ALGORITHM

=end

# def find_dup(array)
#   array.find { |element| array.count(element) > 1 }
# end

# def find_dup(array)
#   no_dups = array.uniq
#   array.each_with_index do |element, index|
#     return element if element != no_dups[index]
#   end
# end

# p find_dup([1, 5, 3, 1]) == 1
# p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
#           38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
#           14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
#           78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
#           89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
#           41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
#           55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
#           85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
#           40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
#           7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73



### 7.3 HALVSIES
=begin
Write a method that takes an Array as an argument, and returns two Arrays (as a pair of nested Arrays) that contain the first half and second half of the original Array, respectively. If the original array contains an odd number of elements, the middle element should be placed in the first half Array.

PROBLEM 7:14
input: array
  - can be empty
  - can contain a single element

outpu: nested array
  - always contains two subarrays
    - first subarray contains all elements of first half of input array
      - if input array has odd # of elements, middle element goes in first array
    - second subarray contains all elements of second half of input array
  - if input array contains only 1 element
    - second subarray will be empty
  - if input array is empty
    - both subarrays will be empty

EXAMPLES

DATA STRUCTURES
- needs:
  - determine midpoint of input array
  - get correct number of elements in each subarray

- input: array
  - subarrays:
    - if array size even:
      - first: index 0, length = size / 2
      - second: index size/2 .. -1
    - if array size odd:
      - first: (index 0, length = (size / 2) + 1) OR (index 0 .. index size/2)
      - second: (index (size/2) + 1 .. -1

- output: array

ALGORITHM
- determine the midpoint of the input array
  - size / 2
- if array size is even:
  - return two subarrays
    - first: input_array[0, size / 2]
    - second: input_array[size/2 .. -1]
if array size is odd:
    - return two subarrays
      - first: input_array[0 .. size/2]
      - second: input_array[(size/2)+1 .. -1]
- return both subarrays in an array
=end

# def halvsies(array)
#   half = (array.size / 2.0).ceil
#   first = array.take(half)
#   second = array - first
#   [first, second]
# end

# def halvsies(array)
#   half = (array.size / 2.0).ceil
#   [array.take(half), array.drop(half)]
# end

# def halvsies(array)
#    half = (array.size / 2.0).ceil
#   array.partition.with_index { |_, index| index < half }
# end

# def halvsies(arr)
#   arr.partition { |num| arr.index(num) < (arr.length / 2.0).ceil }
# end

# p halvsies([1, 2, 3, 2]) #== [[1, 2], [3, 4]]
# p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
# p halvsies([5]) == [[5], []]
# p halvsies([]) == [[], []]




### 6.3 MERGE ARRAYS
=begin
Write a method that takes two Arrays as arguments, and returns an Array that contains all of the values from the argument Arrays. There should be no duplication of values in the returned Array, even if there are duplicates in the original Arrays.

PROBLEM 4:33
input: two arrays

output: array
  - combines all the values from the input arrays
    - no duplicates (even if input arrays contain duplicates)

EXAMPLES

DATA STRUCTURES
- needs:
  - way to access each value in input arrays
  - way to deal with duplicate values

- input: 2 arrays
  - empty array to add non-duplicate values to
- output: array

ALGORITHM
- remove duplicate values from first and second input arrays
- remove values in first input array from second input array
- create an empty array and add all values from both arrays to it
- return that array
=end

# def merge(array1, array2)
#   array1, array2 = array1.uniq, array2.uniq
#   array1.each do |element|
#     array2.delete(element)
#   end
#   array1 + array2
# end

# def merge(array1, array2)
#   (array1 + array2).uniq
# end

# def merge(array1, array2)
#   array1.union(array2)
# end

# def merge(*a_buffet_of_arrays) # => [arg1, arg2, arg3 ... ]
#   a_buffet_of_arrays.inject(:union)
# end

# p merge([1, 3, 5, 3], [3, 6, 9, 6], [9, 10, 11, 11]) #== [1, 3, 5, 6, 9, 10, 11]

# p merge([1, 3, 5, 3], [3, 6, 9, 6]) #== [1, 3, 5, 6, 9]





### 5.3 REVERSED ARRAYS 2
=begin
Write a method that takes an Array, and returns a new Array with the elements of the original list in reverse order. Do not modify the original list.

You may not use Array#reverse or Array#reverse!, nor may you use the method you wrote in the previous exercise.

PROBLEM 7:03
input: array
  - can be empty
  - can contain only one element

output: new array
  - contains same elements as input array, in reverse order
    - order of elements is reversed
    - elements themselves are unchanged
  - input array is not modified
  - if input array is empty or has only one element, output array will look the same

EXAMPLES

DATA STRUCTURES
- needs
  - access each element in input array
  - place it in correct position in output array
    - without modifying input array

- input: array
  - new array to hold reversed values
- output: array

ALGORITHM
- transform input array using indexes
  - each element will be at index -(index + 1)
=end
# def reverse(array)
#   array.each_index.map { |index| array[-(index + 1)] }
# end

# def reverse(array)
#   array.inject([]) { |result, element| result.prepend(element) }
# end

# def reverse(array)
#   array.reduce([], :prepend)
# end

# p reverse([1,2,3,4]) == [4,3,2,1]          # => true
# p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
# p reverse(['abc']) == ['abc']              # => true
# p reverse([]) == []                        # => true

# p list = [1, 3, 2]                      # => [1, 3, 2]
# p new_list = reverse(list)              # => [2, 3, 1]
# p list.object_id != new_list.object_id  # => true
# p list == [1, 3, 2]                     # => true
# p new_list == [2, 3, 1]                 # => true



# def reverse!(array)
#   array.each_index { |index| array.insert(index, array.pop) }
# end

# def reverse!(list)
#   reference_list = list.clone
#   list.each_index { |index| list[index] = reference_list[-(index + 1)] }
# end

# def reverse!(list)
#   reference_list = list.clone
#   list.map! { reference_list.pop }
# end

# def reverse!(array)
#   array.sort_by!.with_index { |_, index| -index }
# end

# array = [1, 2, 3, 4, 3, 5]
# reverse!(array)
# p array #== [5, 4, 3, 3, 2, 1] (should be [5, 3, 4, 3, 2, 1])

### 4.3 REVERSED ARRAYS I
=begin
Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed into this method. The return value should be the same Array object.

You may not use Array#reverse or Array#reverse!.

Note: for the test case list = ['abc'], we want to reverse the elements in the array. The array only has one element, a String, but we're not reversing the String itself, so the reverse! method call should return ['abc'].

PROBLEM: 1:58
input: array
  - can be empty

output: array
  - same array object as input array (i.e. input array is mutated)
  - elements are in reverse order
    - elements themselves are unchanged, only their order in the array is changed
  - if input array has only zero or one element, array will not be changed

EXAMPLES

DATA STRUCTURES
- needs:
  - way to reverse order of elements

- input: array

- output: array

ALGORITHM
- iterate over each index of the input array
- on each iteration, use the index
  - assign the value at the current index to index[- (index + 1)]
- return the array
=end
# def reverse!(list)
#   reference_list = list.clone
#   (0...list.size).each do |index|
#     list[index] = reference_list[-(index + 1)]
#   end
#   list
# end

# def reverse!(list)
#   reference_list = list.clone
#   list.each_index { |index| list[index] = reference_list[-(index + 1)] }
# end

# list1 = [1,2,3,4]
# result1 = reverse!(list1)
# p result1 == [4, 3, 2, 1] # true
# p list1 == [4, 3, 2, 1] # true
# p list1.object_id == result1.object_id # true
# puts
# list2 = %w(a b e d c)
# result2 = reverse!(list2)
# p result2 == ["c", "d", "e", "b", "a"] # true
# p list2 == ["c", "d", "e", "b", "a"] # true
# p list2.object_id == result2.object_id
# puts
# list3 = ['abc']
# result3 = reverse!(list3)
# p result3 == ["abc"] # true
# p list3 == ["abc"] # true
# p list3.object_id == result3.object_id
# puts
# list4 = []
# result4 = reverse!(list4)
# p result4 == [] # true
# p list4 == [] # true
# p list4.object_id == result4.object_id

### 3.3 FIBONACCI LENGTH
=begin
The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) such that the first 2 numbers are 1 by definition, and each subsequent number is the sum of the two previous numbers. This series appears throughout the natural world.

Computationally, the Fibonacci series is a very simple series, but the results grow at an incredibly rapid rate. For example, the 100th Fibonacci number is 354,224,848,179,261,915,075 -- that's enormous, especially considering that it takes 6 iterations before it generates the first 2 digit number.

Write a method that calculates and returns the index of the first Fibonacci number that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)

You may assume that the argument is always greater than or equal to 2.

PROBLEM 7:41
input: integer
  - greater than or equal to 2
  - represents the target number of digits of a fibonacci number

output: integer
  - represents the index of the first Fibonacci number to have the target number of digits
    - first Fibonacci nubmer has index of 1

EXAMPLES

DATA STRUCTURES
- needs
  - way to determine current Fib number
    - way to determine previous two Fib numbers?
  - way to determine number of digits in current Fib number

- input: integer
  - loop
  - counter that represents index
  - array of last two Fib numbers
  - sum of that array
  - sum converted to string to determine length / number of digits
- output: integer

ALGORITHM
- create a variable to track index (set to 3)
- create an array to represent last two Fib numbers (set to [1, 1])
- create a loop
  - current fib number = sum of the array
  - convert sum to a string and get its length
  - if length = input integer, return index
  - if not:
    - reassign first number of array to last number of array
    - reassign last number of array to sum
    - increment index by 1

=end

# def find_fibonacci_index_by_length(target_length)
#   last_pair = [1, 1]
#   index = 3
#   target = 10**(target_length - 1)

#   loop do
#     current_fib = last_pair.sum
#     return index if current_fib >= target

#     last_pair = [last_pair.last, current_fib]
#     index += 1
#   end
# end

# p find_fibonacci_index_by_length(2) #== 7          # 1 1 2 3 5 8 13
# p find_fibonacci_index_by_length(3) #== 12         # 1 1 2 3 5 8 13 21 34 55 89 144
# p find_fibonacci_index_by_length(10) == 45
# p find_fibonacci_index_by_length(100) == 476
# p find_fibonacci_index_by_length(1000) == 4782
# p find_fibonacci_index_by_length(10000) == 47847



### 2.3 DELETE VOWELS
=begin
Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed.

PROBLEM 12:14
input: array
  - elements are strings

output: array
  - elements are same string values with aeiou/AEIOU removed
  - case is preserved
  - if a string contains only vowels, return an empty string
  - output array contains same number of elements as input array

EXAMPLES

DATA STRUCTURES
- needs:
  - consider each string individually
  - consider each character individually
  - identify vowels
  - remove vowels

- input: array
  - for each element in array:
    - string of vowels (upper and lowercase)
    - string with vowels deleted
- output: array

ALGORITHM
- create a string of vowels: 'AEIOUaeiou'
- transform input array:
  - for each element, delete vowels
- return transformed array
=end

# def remove_vowels(words)
#   words.map { |word| word.delete('AEIOUaeiou') }
# end

# p remove_vowels(["abcdefghijklmnopqrstuvwxyz"]) == ["bcdfghjklmnpqrstvwxyz"]
# p remove_vowels(["green", "YELLOW", "black", "white"]) == ["grn", "YLLW", "blck", "wht"]
# p remove_vowels(["ABC", "AEIOU", "XYZ"]) == ['BC', '', 'XYZ']




### 1.3 CUTE ANGLES
=begin
Write a method that takes a floating point number that represents an angle between 0 and 360 degrees and returns a String that represents that angle in degrees, minutes and seconds. You should use a degree symbol (°) to represent degrees, a single quote (') to represent minutes, and a double quote (") to represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

Note: your results may differ slightly depending on how you round values, but should be within a second or two of the results shown.

You should use two digit numbers with leading zeros when formatting the minutes and seconds, e.g., 321°03'07".

You may use this constant to represent the degree symbol:
DEGREE = "\xC2\xB0"

PROBLEM 7:03
input: float
  - represents an angle
    - between 0 and 360 degrees

output: string
  - represents same angle in degrees, minutes, and seconds
  - formatting:
    - degrees: °, minutes: ', seconds: "
    - use leading zeros for minutes and seconds
      - but not for degrees
    - example: 321°03'07"
  - conversion:
    - 1 degree = 60 minutes
    - 1 minute == 60 seconds

EXAMPLES

DATA STRUCTURES
- needs
  - separate decimals from whole numbers
  - convert decimals into minutes and seconds
  - format final string

- input: float
  - converted to seconds
  - converted to minutes and seconds
- string

ALGORITHM
- convert input float into seconds
  - float * 360
-
=end

# MINUTES_PER_DEGREE = 60
# SECONDS_PER_MINUTE = 60
# SECONDS_PER_DEGREE = 3600 # MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

# def dms(angle)
#   dms = calculate_dms(angle)
#   apply_format(dms)
# end

# def calculate_dms(degrees_float)
#   total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
#   degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
#   minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
#   [degrees, minutes, seconds]
# end

# def apply_format(dms)
#   degrees, minutes, seconds = dms.map(&:to_s)
#   [minutes, seconds].map { |unit| unit.size == 1 ? unit.prepend('0') : unit }
#   "#{degrees}°#{minutes}'#{seconds}\""
# end

# p calculate_dms(254.6)

# puts dms(30) == %(30°00'00")
# puts dms(76.73) == %(76°43'48")
# puts dms(254.6) == %(254°36'00")
# puts dms(93.034773) == %(93°02'05")
# puts dms(0) == %(0°00'00")
# puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")





### 10.2 MUTATION
# array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
# array2 = []

# array1.each { |value| array2 << value }

# array1.each { |value| value.upcase! if value.start_with?('C', 'S') }

# puts array2

### 9.2 DOES MY LIST INCLUDE THIS?
# def include?(array, search_value)
#   array.each { |element| return true if element == search_value }
#   false
# end

# def include?(array, search_value)
#   array.count(search_value) > 0
# end

# p include?([1,2,3,4,5], 3) == true
# p include?([1,2,3,4,5], 6) == false
# p include?([], 3) == false
# p include?([nil], nil) == true
# p include?([], nil) == false

### 8.2 FIND THE DUPLICATE
# def find_dup(array)
#   array.tally.key(2) || "No duplicate found."
# end

# def find_dup(array)
#   seen = []
#   index = 0

#   loop do
#     current_element = array[index]
#     return current_element if seen.include?(current_element)
#     seen << current_element
#     index += 1
#     break if index >= array.size
#   end
#   "No duplicate found."
# end

# def find_dup(array)
#   array.each do |element|
#     return element if array.count(element) > 1
#   end
#   "No duplicate found."
# end

# p find_dup([1, 5, 1, 3])# == 1
# p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
#           38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
#           14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
#           78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
#           89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
#           41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
#           55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
#           85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
#           40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
#           7,  34, 57, 74, 45, 11, 88, 67,  5, 58])# == 73
# p find_dup([1, 2, 3, 4, 5])

### 7.2 HALVSIES
# def halvsies(array)
#   midpoint = array.size / 2
#   front_slice_size = array.size - midpoint

#   front_slice = array[0, front_slice_size]
#   back_slice = array - front_slice
#   [front_slice, back_slice]
# end

# array = [1, 2, 3, 4, 5]
# p halvsies(array)
# p array

# p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
# p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
# p halvsies([5]) == [[5], []]
# p halvsies([]) == [[], []]

### 6.2 COMBINING ARRAYS
# def merge(array_1, array_2) # non-mutating
#   array_1 | array_2
# end

# def merge(array1, array2) # non-mutating
#   (array1 + array2).uniq
# end

# def merge(array1, array2) # non-mutating
#   array1 + array2.reject { |element| array1.include?(element) }
# end

# def merge(array1, array2) # MUTATING
#   array2.each_with_object(array1) do |element, array1|
#     array1 << element unless array1.include?(element)
#   end
# end

# def merge(array1, array2) # MUTATING
#   array2.inject(array1, :<<).uniq
# end

# def merge(array1, array2) # MUTATING
#   array2.inject(array1) do |array1, element|
#     array1.include?(element) ? array1 : array1 << element
#   end
# end


# def merge(array1, array2) # non-mutating
#   result = [] + array1
#   array2.each_with_object(result) do |element, result|
#     result << element unless array1.include?(element)
#   end
# end

# def merge(array1, array2) # non-mutating
#   result = [] + array1
#   array2.inject(result, :<<).uniq
# end

# def merge(array1, array2) # non-mutating
#   result = [] + array1
#   array2.inject(result) do |result, element|
#     array1.include?(element) ? result : result << element
#   end
# end

# array1 = [1, 3, 5]
# array2 = [3, 6, 9]
# puts "array1: #{array1}, #{array1.object_id}"
# puts "array2: #{array2}, #{array2.object_id}"
# merged = merge(array1, array2)
# puts
# puts "merged: #{merged}, #{merged.object_id}"
# puts
# puts "array1: #{array1}, #{array1.object_id}"
# puts "array2: #{array2}, #{array2.object_id}"

### 5.2 REVERSED ARRAYS II
# def reverse(list)
#   list.each_index.map { |index| list[-(index + 1)] }
# end

# def reverse(list)
#   list.each_index.map { |index| list[-index - 1] }
# end

# def reverse(list)
#   list.each_index.map { |index| list[(list.size - 1) - index] }
# end

# def reverse(list)
#   1.upto(list.size).map { |index| list[-index] }
# end

# def reverse(list)
#   -1.downto(-list.size).map { |index| list[index] }
# end

# p reverse([1,2,3,4]) == [4,3,2,1]          # => true
# p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
# p reverse(['abc']) == ['abc']              # => true
# p reverse([]) == []                        # => true

# list = [1, 3, 2]                      # => [1, 3, 2]
# new_list = reverse(list)              # => [2, 3, 1]
# p list.object_id != new_list.object_id  # => true
# p list == [1, 3, 2]                     # => true
# p new_list == [2, 3, 1]                 # => true

### 4.2 REVERSED ARRAYS I
# def reverse!(array)
#   (array.size / 2).times do |index|
#     array[index], array[-(index + 1)] = array[-(index + 1)], array[index]
#   end
#   array
# end

# def reverse!(list)
#   list.each_index do |index|
#     front, back = index, -(index + 1)
#     list[front], list[back] = list[back], list[front] if index < list.size / 2
#   end
# end

### DANIEL CHAE
# def reverse!(a)
#   a[0..].each_with_index.each_with_object(a) { |(v, i), a| a[-i - 1] = v }
# end

# def reverse!(list)
#   list.clone.each_with_index.with_object(list) do |(element, index), list|
#     list[-(index + 1)] = element
#   end
# end

# More memory efficient, but potentially slower one-liner (amortized O(n))
# def reverse!(a)
#   a.each_with_index { |v, i| a.unshift(a.delete_at(i)) }
# end

# def preverse!(list)
#   list.each_index { |index| list.prepend(list.delete_at(index)) }
# end

###
# list = [1,2,3,4]
# result = reverse!(list)
# p result == [4, 3, 2, 1] # true
# p list == [4, 3, 2, 1] # true
# p list.object_id == result.object_id # true

# list = %w(a b e d c)
# p reverse!(list) == ["c", "d", "e", "b", "a"] # true
# p list == ["c", "d", "e", "b", "a"] # true

# list = ['abc']
# p reverse!(list) == ["abc"] # true
# p list == ["abc"] # true

# list = []
# p reverse!(list) == [] # true
# p list == [] # true

### 3.2 FIBONACCI NUMBER LOCATION BY LENGTH
# def find_fibonacci_index_by_length(length)
#   limit = 10**(length - 1)
#   fibonaccis = [1, 1]
#   until fibonaccis.last >= limit
#     fibonaccis << (fibonaccis[-2] + fibonaccis[-1])
#   end
#   fibonaccis.size
# end

# def find_fibonacci_index_by_length(length)
#   limit = 10**(length - 1)
#   current_pair = [1, 1]
#   index = 2
#   until current_pair.last >= limit
#     next_number = current_pair.sum
#     current_pair = [current_pair.last, next_number]
#     index += 1
#   end
#   index
# end

# def find_fibonacci_index_by_length(length)
#   limit = 10**(length - 1)
#   current_pair = [1, 1]
#   index = 2
#   loop do
#     return index if current_pair.last >= limit
#     next_number = current_pair.sum
#     current_pair = [current_pair.last, next_number]
#     index += 1
#   end
# end

# def find_fibonacci_index_by_length(length)
#   current_pair = [1, 1]
#   index = 3
#   loop do
#     next_number = current_pair.sum
#     return index if next_number.to_s.size >= length
#     index += 1
#     current_pair = [current_pair.last, next_number]
#   end
# end

# p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
# p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
# p find_fibonacci_index_by_length(10) == 45
# p find_fibonacci_index_by_length(100) == 476
# p find_fibonacci_index_by_length(1000) == 4782
# p find_fibonacci_index_by_length(10000) == 47847

### 2.2 DELETE VOWELS
# VOWELS = 'AEIOUaeiou'
# def remove_vowels(strings_array)
#   strings_array.map {|string| string.delete(VOWELS) }
# end

# p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

### 1.2 CUTE ANGLES
# DEGREE = "\xC2\xB0"
# MINUTES_PER_DEGREE = 60
# SECONDS_PER_MINUTE = 60

# def dms(angle)
#   dms = get_dms(angle)
#   format_dms(dms)
# end

# def get_dms(degrees)
#   minutes = (degrees - degrees.truncate) * MINUTES_PER_DEGREE
#   seconds = (minutes - minutes.truncate) * SECONDS_PER_MINUTE
#   [degrees, minutes, seconds].map(&:truncate)
# end

# def format_dms(dms)
#   degrees, minutes, seconds = dms
#   minutes, seconds = [minutes, seconds].map { |value| sprintf('%02d', value) }
#   "#{degrees}#{DEGREE}#{minutes}'#{seconds}\""
# end

# p dms(30) == %(30°00'00")
# p dms(76.73) == %(76°43'48")
# p dms(254.6) == %(254°35'59")
# p dms(93.034773) == %(93°02'05")
# p dms(0) == %(0°00'00")
# p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

### 10 MUTATION
# array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
# p array1.object_id
# array2 = []
# p array2.object_id
# puts
# array1.each { |value| array2 << value }
# p array1.object_id
# p array2.object_id
# puts
# array2.each { |value| value.upcase! if value.start_with?('C', 'S') }
# p array1
# p array1.object_id
# puts
# p array2
# p array2.object_id

### 9 DOES MY LIST INCLUDE THIS?
# def include?(array, target)
#   array.each { |ele| return true if ele == target }
#   false
# end

# def include?(array, target)
#   !!array.index(target)
# end

# def include?(array, target)
#   !(array.select { |ele| ele == target }.empty?)
# end

# def include?(array, target)
#   array.any?(target)
# end

# def include?(array, target)
#   !(array.all? { |ele| ele != target })
# end

# def include?(array, target)
#   !array.none?(target)
# end

# def include?(array, target)
#   array.count(target) > 0
# end

# def include?(array, target)
#   (array.reject { |ele| ele == target }).size != array.size
# end

# def include?(array, target)
#   !(array.delete_if { |ele| ele != target }.empty?)
# end

# def include?(array, target)
#   array.delete_if { |ele| ele != target }.size > 0
# end

# def include?(array, target)
#   original_size = array.size
#   (array.delete_if { |ele| ele == target }.size) != original_size
# end

# def include?(array, target)
#   array.intersection([target]).size > 0
# end

# def include?(array, target)
#   (array << target).uniq! != nil
# end

# def include?(array, target)
#   (array << target).uniq.size != array.size
# end

# p include?([1,2,3,4,5], 3) == true
# p include?([1,2,3,4,5], 6) == false
# p include?([], 3) == false
# p include?([nil], nil) == true
# p include?([], nil) == false

### 8 FIND THE DUPLICATE
# def find_dup(array)
#   array.sort.each_cons(2) do |pair|
#     return pair[0] if pair[0] == pair[1]
#   end
# end

# def find_dup(array)
#   array.sort!.each_with_index do |num, idx|
#     return num if num == array[idx + 1]
#   end
# end

# def find_dup(array)
#   array.find { |num| array.count(num) == 2 }
# end

# def find_dup(array)
#   array.each_with_object([]) do |num, seen|
#     return num if seen.include?(num)
#     seen << num
#   end
# end

# def find_dup(array)
#   array.uniq.each do |num|
#     array.delete_at(array.index(num))
#   end
#   array.first
# end

# def find_dup(array)
#   array.sum - array.uniq.sum
# end

# p find_dup([1, 5, 3, 1]) #== 1
# p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
#           38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
#           14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
#           78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
#           89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
#           41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
#           55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
#           85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
#           40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
#           7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) #== 73

### 7 HALVSIES
# def halvsies(array)
#   sub_array1 = array.select.with_index do |_, idx|
#     idx <= (array.size - 1)/2
#   end
#   sub_array2 = array.select.with_index do |_, idx|
#     idx > (array.size - 1)/2
#   end
#   [sub_array1, sub_array2]
# end

# def halvsies(array)
#   left = array[0..((array.size - 1)/2)]
#   right = array[(left.size)..]
#   [left, right]
# end

# def halvsies(array)
#   half = array.size.divmod(2).sum
#   left, right = array.slice(0, half), array.slice(half, array.size - half)
# end

# p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
# p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
# p halvsies([5]) == [[5], []]
# p halvsies([]) == [[], []]

### 6 COMBINING ARRAYS
# def merge(arr1, arr2)
#   arr2.each do |ele|
#     arr1 << ele unless arr1.include?(ele)
#   end
#   arr1
# end

# def merge(arr1, arr2)
#   arr2.inject(arr1, :<<).uniq
# end

# p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

### 5 REVERSED ARRAYS II
# def reverse(array)
#   new_array = []
#   index = array.length - 1
#   until index < 0
#     new_array << array[index]
#     index -= 1
#   end
#   new_array
# end

# def reverse(array)
#   index = array.length - 1
#   array.each_with_object([]) do |_, arr|
#     arr << array[index]
#     index -= 1
#   end
# end

# def reverse(array)
#   array.each_index.with_object([]) do |idx, new_array|
#     new_array << array[(array.length - 1) - idx]
#   end
# end

# def reverse(array)
#   array.reverse_each.with_object([]) do |ele, new_array|
#     new_array << ele
#   end
# end

# def reverse(array)
#   array.inject([]) do |new_array, element|
#     new_array.prepend(element)
#   end
# end

# def reverse(array)
#   array.each_with_object([]) do |element, new_array|
#     new_array.prepend(element)
#   end
# end

# def reverse(arr)
#   arr.inject([], :prepend)
# end

# p reverse([1,2,3,4]) == [4,3,2,1]          # => true
# p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
# p reverse(['abc']) == ['abc']              # => true
# p reverse([]) == []                        # => true

# list = [1, 3, 2]                      # => [1, 3, 2]
# new_list = reverse(list)              # => [2, 3, 1]
# p list.object_id != new_list.object_id  # => true
# p list == [1, 3, 2]                     # => true
# p new_list == [2, 3, 1]                 # => true

### 4 REVERSED ARRAYS I
# def reverse!(array)
#   new_array = []
#   (array.size).times do
#     new_array << array.pop
#   end

#   (new_array.size).times do
#     array << new_array.shift
#   end
#   array
# end

# def reverse!(array)
#   front = 0
#   back = -1
#   until front >= array.size / 2
#     array[front], array[back] = array[back], array[front]
#     front += 1
#     back -= 1
#   end
#   array
# end

# def reverse!(array)
#   left = 0
#   right = array.size - 1
#   until left > right
#     array[left], array[right] = array[right], array[left]
#     left += 1
#     right -= 1
#   end
#   array
# end

# def reverse!(arr)
#   iterations = arr.size / 2 - 1
#   for i in (0..iterations)
#     arr[i], arr[(-i)-1] = arr[(-i)-1], arr[i]
#   end
#   arr
# end

# list = [1,2,3,4,5]
# result = reverse!(list)
# p result == [5, 4, 3, 2, 1] # true
# p list == [5, 4, 3, 2, 1] # true
# p list.object_id == result.object_id # true

# list = %w(a b e d c)
# p reverse!(list) == ["c", "d", "e", "b", "a"] # true
# p list == ["c", "d", "e", "b", "a"] # true

# list = ['abc']
# p reverse!(list) == ["abc"] # true
# p list == ["abc"] # true

# list = []
# p reverse!(list) == [] # true
# p list == [] # true

### 3 FIBONACCI NUMBER LOCATION BY LENGTH
# def find_fibonacci_index_by_length(length)
#   num1, num2 = 1, 1
#   index = 3
#   loop do
#     next_num = num1 + num2
#     return index if next_num.to_s.size >= length
#     index += 1
#     num1, num2 = num2, next_num
#   end
# end

# def find_fibonacci_index_by_length(length)
#   current_pair = [1, 1]
#   index = 3
#   loop do
#     next_num = current_pair.sum
#     return index if next_num.to_s.size >= length
#     index += 1
#     current_pair[0], current_pair[1] = current_pair[1], next_num
#   end
# end

# p find_fibonacci_index_by_length(2) == 7   # 1 1 2 3 5 8 13
# p find_fibonacci_index_by_length(3) == 12  # 1 1 2 3 5 8 13 21 34 55 89 144
# p find_fibonacci_index_by_length(10) == 45
# p find_fibonacci_index_by_length(100) == 476
# p find_fibonacci_index_by_length(1000) == 4782
# p find_fibonacci_index_by_length(10000) == 47847

### 2 DELETE VOWELS
# VOWELS = "aeiouAEIOU"

# def remove_vowels(string_array)
#   string_array.map { |string| string.delete(VOWELS) }
# end

# def remove_vowels(string_array)
#   string_array.map { |string| string.gsub(/[aeiou]/i, "") }
# end

# def remove_vowels(string_array)
#   string_array.map do |string|
#     string.chars.each do |char|
#       char = VOWELS.include?(char) ? "" : char
#     end.join
#   end
# end

# def remove_vowels(string_array)
#   string_array.map do |string|
#     string.chars.map do |char|
#       char = VOWELS.include?(char) ? "" : char
#     end.join
#   end
# end

# def remove_vowels(string_array)
#   string_array.map do |string|
#     new_string = ""
#     string.each_char do |char|
#       new_string << char unless VOWELS.include?(char)
#     end
#     new_string
#   end
# end

# def remove_vowels(string_array)
#   string_array.map do |string|
#     string.each_char.with_object("") do |char, new_string|
#       new_string << char unless VOWELS.include?(char)
#     end
#   end
# end

# p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

### 1 CUTE ANGLES
# DEGREE = "\xC2\xB0"
# MINUTES_PER_DEGREE = 60
# SECONDS_PER_MINUTE = 60
# SECONDS_PER_DEGREE = 3600 # MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

# def dms(degrees_float)
#   total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
#   degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
#   minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
#   format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
# end

# # def dms(angle)
# #   degrees = angle
# #   minutes = (degrees % 1) * 60
# #   seconds = (minutes % 1) * 60
# #   %Q(%(#{sprintf("%d", degrees)}°#{sprintf("%02d", minutes)}'#{sprintf("%02d", seconds)}\"))
# # end

# puts dms(30) #== %(30°00'00")
# puts dms(76.73) #== %(76°43'48")
# puts dms(254.6) #== %(254°36'00")
# puts dms(93.034773) #== %(93°02'05")
# puts dms(0) #== %(0°00'00")
# puts dms(360) #== %(360°00'00") || dms(360) == %(0°00'00")

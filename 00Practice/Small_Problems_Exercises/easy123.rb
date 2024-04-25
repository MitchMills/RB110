=begin
Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.

A running total is the sum of all values in a list up to and including the current element. Thus, the running total when looking at index 2 of the array [14, 11, 7, 15, 20] is 32 (14 + 11 + 7), while the running total at index 3 is 47 (14 + 11 + 7 + 15).

PROBLEM
input: array
  - elements are numbers
  - can be empty
output: array
  - same number of elements as input array
  - each element is a running total from input array
    - running total:
      - sum of all values up to and including the current element
  - first element will always be the same as input array
  - if input array is empty, return empty array

EXAMPLES

DATA STRUCTURES
- needs:
  - way to determine total for each index in output array

- input: array
  - subarrays: all element up to current index
    - [0], [0, 1], [0, 1, 2] etc
  - range: from 0 up to last index
- output: array

ALGORITHM
- get sum of all element up to and including current element
  - for each index in input array
    - get the sum of all elements up to that index
    - transorm index into that sum
- return sums array
=end

# Initial solution
def running_total(array)
  array.each_index.map { |index| array[0..index].sum }
end

# Same approach using `#with_object`.
# When you know the output array will have the same number of elements as the
# input array, `#with_object([])` or `#each_with_object([])` is basically just
# a more verbose version of `#map`
def running_total(array)
  array.each_index.with_object([]) do |index, result|
    result << array[0..index].sum
  end
end

# A few different solutions using `#inject`. With a block, `#inject` can
# behave very similarly to `#each_with_object`, only with the position of the
# element and object parameters flipped.
# The only somewhat tricky part of this solution is dealing with the fact that
# the accumulator array either starts off empty (in which case `result.last`
# returns `nil` on the first iteration), or has an extra element at index 0 if
# you supply a starting value for the accumulator array.
# My first solution uses an `||` clause to guard against a `nil` value. I didn't
# realize until looking at others' solutions that `nil.to_i` returns 0!

def running_total(array)
  array.inject([]) { |result, number| result << (result.last || 0) + number }
end

def running_total(array)
  array.inject([]) { |result, number| result << result.last.to_i + number }
end

def running_total(array)
  array.inject([0]) { |result, number| result << result.last + number }[1..]
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

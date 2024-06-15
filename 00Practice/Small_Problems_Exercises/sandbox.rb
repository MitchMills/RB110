=begin


matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]
An Array of Arrays is sometimes called nested arrays because each of the inner Arrays is nested inside an outer Array.

To access an element in matrix, you use Array#[] with both the row index and column index. So, in this case, matrix[0][2] is 8, and matrix[2][1] is 9. An entire row in the matrix can be referenced by just using one index: matrix[1] is the row (an Array) [4, 7, 2]. Unfortunately, there's no convenient notation for accessing an entire column.

The transpose of a 3 x 3 matrix is the matrix that results from exchanging the columns and rows of the original matrix. For example, the transposition of the array shown above is:

Copy Code
1  4  3
5  7  9
8  2  6
Write a method that takes a 3 x 3 matrix in Array of Arrays format and returns the transpose of the original matrix. Note that there is a Array#transpose method that does this -- you may not use it for this exercise. You also are not allowed to use the Matrix class from the standard library. Your task is to do this yourself.

In the previous exercise, you wrote a method to transpose a 3 x 3 matrix as represented by a ruby Array of Arrays.

Matrix transposes aren't limited to 3 x 3 matrices, or even square matrices. Any matrix can be transposed by simply switching columns with rows.

Modify your transpose method from the previous exercise so it works with any matrix with at least 1 row and 1 column.

PROBLEM 9:08
input: one array
  - nested
    - always going to contain at least one subarray
    - every subarray contains the same number of elements

output: array
  - nested
    - rows become columns, or vice versa
    - if input array only has one subarray, return as is
    - number of elements in each subarray of input array
      - equals the number of new subarrays in output array
    - number of subarrays in input array
      - equals number of elements in each subarray of output array

EXAMPLES

DATA STRUCTURES
- needs:
  - access each element in each subarray
  - way to transpose elements
    - first element in each subarray becomes first in new subarray
    - second ... etc

- start: nested array
  - new array with appropriate number of subarrays (number of elements in input subarrays)
- finish: nested array

ALGORITHM
- create a new array to populate
  - contains subarrays, number is size of input subarrays
- consider each subarray in input array
  - for each subarray
    - add the element at a particular index to the output array subarray with that same index
- return the new array

[
  [1, 2, 3, 4]  array
]

[1, 2, 3, 4]  subarray
 0  1  2  3   indexes

[
  [],       result
  [],
  [],
  []
]

[1, 2, 3, 4]

[1]
[2]
[3]
[4]

[1, 2, 3, 4, 5]
[4, 3, 2, 1, 0]
[3, 7, 8, 6, 2]

[1]
=end

def transpose1(array)
  number_of_subarrays = array.first.size
  result = Array.new(number_of_subarrays) { |_index| Array.new }

  array.each do |subarray|
    subarray.each_with_index do |element, index|
      result[index] << element
    end
  end

  result
end

def transpose(array)
  number_of_subarrays = array.first.size
  result = Array.new(number_of_subarrays, [])

  array.each do |subarray|
    subarray.each_with_index do |element, index|
      result[index] += [element]
    end
  end

  result
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) == [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]

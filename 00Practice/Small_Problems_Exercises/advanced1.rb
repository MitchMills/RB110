### 2 SEEING START
=begin
Write a method that displays an 8-pointed star in an nxn grid, where n is an odd integer that is supplied as an argument to the method. The smallest such star you need to handle is a 7x7 grid.

PROBLEM
input: integer
  - odd
  - >= 7

output: strings (displayed to screen)
  - number of strings (rows) = input integer
  - all rows contain three *s except middle row
  - middle row = (input integer + 1) / 2
    - contains same number of *s as input integer
  - non-middle rows:
    - number = input integer - 1
      - number above and below: input integer / 2
  - top and bottom rows:
    - first and last characters are *s
      - indexes 0 and (input integer - 1)
    - middle character is a *
      - index (input integer / 2)

  - [['*' * input_integer] * input_integer]

ADD
* 1 2 * 4 5 *   # 0, 3, 6
0 * 2 * 4 * 6   # 1, 3, 5
0 1 * * * 5 6   # 2, 3, 4
* * * * * * *
0 1 * * * 5 6   # 2, 3, 4
0 * 2 * 4 * 6   # 1, 3, 5
* 1 2 * 4 5 *   # 0, 3, 6

first star:   0 1 2
second star:  3
last star:   6 5 4
=end

def star(size)
  all_rows = get_all_rows(size)
  puts all_rows
end

def get_all_rows(star_size)
  top_rows = get_top_rows(star_size)
  middle_row = ['*' * star_size]
  bottom_rows = top_rows.reverse
  top_rows + middle_row + bottom_rows
end

def get_top_rows(star_size)
  number_of_rows = star_size / 2
  last_index = star_size - 1

  number_of_rows.times.map do |row_number|
    star_indexes = get_star_indexes(row_number, last_index)
    get_one_row(star_size, star_indexes)
  end
end

def get_star_indexes(row_number, last_index)
  first_star_index = row_number
  middle_star_index = last_index / 2
  last_star_index = last_index - first_star_index
  [first_star_index, middle_star_index, last_star_index]
end

def get_one_row(star_size, star_indexes)
  star_size.times.map { |index| star_indexes.include?(index) ? '*' : ' ' }.join
end

star(7)

### 3 MATRIX, MUTATING
=begin
PROBLEM 4:51
input: array
  - nested:
    - array contains three subarray elements
      - each subarray contains three integer elements

output: same array
  - mutated in place
  - transposed:
    - the element in each index position of each subarray should now be in
      - the subarray at that index position

EXAMPLES
matrix[0] => [
  1, # matrix[0][0] => matrix![0][0]
  5, # matrix[0][1] => matrix![1][0]
  8  # matrix[0][2] => matrix![2][0]
]

DATA STRUCTURES
needs:
  - way to control row number
  - way to control subarray index
  - way to mutate array (reassign elements)

start: array of subarrays
  - each row: matrix[0], matrix[1], matrix[2]
  - subarray indexes: matrix[0][0], matrix[0][1], etc
finish: same array of subarrays

matrix[0][1] => 5
matrix[1][0] => 4

matrix[0][2] => 8
matrix[2][0]
###
matrix =. [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
matrix[1] => [4, 7, 2]
matrix[1][0] => 4
matrix[0][1] => 5

ALGORITHM
- for each subarray, with its index: row index
  - for each subarray element, with its index: column index
    - reassign the element
      - matrix[row_index][column_index] = matrix[column_index][row_index]
- return the mutated array
=end

# def transpose!(array)
#   array.each_index do |row_idx|
#     (0..row_idx).each do |column_idx|
#       row = array[row_idx]
#       column = array[column_idx]

#       row[column_idx], column[row_idx] = column[row_idx], row[column_idx]
#     end
#   end

#   array
# end

# matrix = [
#   [1, 2, 3],
#   [4, 5, 6],
#   [7, 8, 9]
# ]

# p matrix
# puts
# transpose!(matrix)
# p matrix #== [[1, 4, 3], [5, 7, 9], [8, 2, 6]]

### 3 MATRIX, NON-MUTATING
=begin
A 3 x 3 matrix can be represented by an Array of Arrays in which the main Array and all of the sub-Arrays has 3 elements. For example:

1  5  8
4  7  2
3  9  6

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

The transpose of a 3 x 3 matrix is the matrix that results from exchanging the columns and rows of the original matrix. For example, the transposition of the array shown above is:

1  4  3
5  7  9
8  2  6

Write a method that takes a 3 x 3 matrix in Array of Arrays format and returns the transpose of the original matrix. Note that there is a Array#transpose method that does this -- you may not use it for this exercise. You also are not allowed to use the Matrix class from the standard library. Your task is to do this yourself.

Take care not to modify the original matrix: you must produce a new matrix and leave the original matrix unchanged.

PROBLEM 11:46
input: array
  - nested
  - contains three elements: subarrays
    - each subarray contains three element: integers

output: array
  - 'transposed' input array
    - 3 subarrays, each with 3 integers
      - each subarray contains all the elements
        - from each subarray of the input array
          - at the same index as the new subarray
        - e.g. new subarray at index 1 contains elements
          - at index 1
            - from all three input array subarrays
  - new array, do not modify input array

EXAMPLES

DATA STRUCTURES
needs:
  - way to determine which elements to put in each new subarray of return array

start: array, with 3 subarrays, with 3 integers each
  - new empty array with three empty subarrays
finish: new array, with 3 subarrays, with 3 integers each

ALGORITHM
- create a new empty array: result
  - add three empty subarrays to this array
- for each subarray in the input array
  - for each element in the subarray
    - add same value to result array
      - into subarray that has the same index as the current element
- return result
=end

# def transpose(matrix)
#   new_matrix = Array.new(3) { [] }

#   matrix.each do |subarray|
#     subarray.each_with_index { |element, index| new_matrix[index] << element }
#   end

#   new_matrix
# end

###
# def transpose(matrix)
#   matrix.map.with_index do |subarray, row_index|
#     subarray.each_index.map { |column_index| matrix[column_index][row_index] }
#   end
# end
###

# matrix = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]

# new_matrix = transpose(matrix)

# p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

### 1 MADLIBS II
=begin
Let's build another program using madlibs. We made a program like this in the easy exercises. This time, the requirements are a bit different.

Make a madlibs program that reads in some text from a text file that you have created, and then plugs in a selection of randomized nouns, verbs, adjectives, and adverbs into that text and prints it. You can build your lists of nouns, verbs, adjectives, and adverbs directly into your program, but the text data should come from a file or other external source. Your program should read this text, and for each line, it should place random words of the appropriate types into the text, and print the result.

Example output:
The sleepy brown cat noisily
licks the sleepy yellow
dog, who lazily licks his
tail and looks around.

Example text data:
The %{adjective} brown %{noun} %{adverb}
%{verb} the %{adjective} yellow
%{noun}, who %{adverb} %{verb} his
%{noun} and looks around.

Example replacement words
- adjectives: quick lazy sleepy ugly
- nouns: fox dog head leg
- verbs: jumps lifts bites licks
- adverb: easily lazily noisily excitedly

PROBLEM 12:52
input: text from a text file
=end

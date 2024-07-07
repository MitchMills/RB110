### 2
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

def transpose(matrix)
  new_matrix = Array.new(3) { [] }

  matrix.each do |subarray|
    subarray.each_with_index { |element, index| new_matrix[index] << element }
  end

  new_matrix
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

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

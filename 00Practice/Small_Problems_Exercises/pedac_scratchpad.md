# PROBLEM
Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.

- input: string

- output: array
  - list of all substrings that start at first character of original string
  - arranged in order from shortest to longest
  - final element of output array has same value as original string
  - first element has one character, each subsequent element is one character longer
  - size of output array is the same as the size of the input string

# EXAMPLES
leading_substrings('abc') == ['a', 'ab', 'abc']
leading_substrings('a') == ['a']
leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

# DATA STRUCTURES
- STRING # 'abc'
  - arrray of separate characters # ['a', 'b', 'c']
    - can transform this array into output array
- ARRAY # ['a', 'ab', 'abc']

# ALGORITHM
- convert input string into an array of separate characters
- transform each element in array into string of all characters up to that position
  - use the index of the current element in the array
    - transform element into characters from input string from index 0 up to that index
- return array

# # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # #

# PROBLEM


- input: 

- output:

# EXAMPLES


# DATA STRUCTURES


# ALGORITHM

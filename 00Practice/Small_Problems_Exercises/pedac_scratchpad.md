# PROBLEM
Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as it does backwards. The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.

You may (and should) use the substrings method you wrote in the previous exercise.

For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.

- input: string

- output: array
  - list of all palindromic substrings in input string
  - palindrome:
    - same sequence of characters forwards and backwards
    - doesn not need to be an actual word
    - consider all characters (e.g. spaces, non-letters, etc)
    - case sensitive ('AbA' is a palindrome, 'Aba' is not)
    - palindromes must be at least two characters
  - should be arranged in same order substrings appear in input string
  - duplicate palindromes should be included multiple times

# EXAMPLES
palindromes('abcd') == []
palindromes('madam') == ['madam', 'ada']
palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

string size: 5
start_indexes: 0, 1, 2, 3, 4 => 0 up to but not including string size
substring_sizes: 2, 3, 4, 5 => 1 up to (string size - start index) 

# DATA STRUCTURES
- STRING
  - array of all substrings
    - transformation
  - array of all palindromes
    - selection
- ARRAY

# ALGORITHM
- get all substrings size 2 or larger
  - transform a range of start indexes into a nested array
    - transform a range of substring sizes into an array
- select all palindromes
  - test each substring to see if it is the same forwards as backwards

# # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # #

# PROBLEM


- input: 

- output:

# EXAMPLES


# DATA STRUCTURES


# ALGORITHM

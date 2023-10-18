# PROBLEM
Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

- input: string
  - contains "number words", e.g. "one"
    - does case matter?
- output: same string
  - all number words converted into equivalent digits

# EXAMPLES
word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# DATA STRUCTURES
- input: string
  - array of individual words
  - hash with word / digit correspondences
    { one: 1, two: 2 . . .}
- output: string

- how to deal with punctuation
  - will only appear at end of words
    - e.g. "four.", "seven,"
    - "four.".include?("four") => true

# ALGORITHM
- Find all target words
  - create a hash of word to digit correspondences
  - separate input string into an array of individual words
  - iterate over each word
    - remove punctuation
      - iterate over array of number words
        - if target word includes number word, 
- Convert target words into digit equivalents
  - iterate over each word in array
    - transform target words into digit equivalents using hash
- Return string
  - join transformed array into string and return it

# # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # #

# PROBLEM


- input: 

- output:

# EXAMPLES


# DATA STRUCTURES


# ALGORITHM

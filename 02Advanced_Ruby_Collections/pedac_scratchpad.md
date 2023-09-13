# PROBLEM
Write a function triple_double(num1, num2) which takes numbers num1 and num2 and returns 1 if there is a straight triple of a number at any place in num1 and also a straight double of the same number in num2.

If this isn't the case, return 0

input: two integers

output: 0 or 1
  - return 1 if a given digit appears three times in a row in first input integer AND two times in a row in second input integer
  - return 0 otherwise
  - triple and double mean a single digit repeated 3 or 2 times

# EXAMPLES
p triple_double(12345, 12345) == 0
p triple_double(1222345, 12345) == 0
p triple_double(666789, 12345667) == 1
p triple_double(451999277, 41177722899) == 1



# DATA STRUCTURE(S)
- integers
  - integer converted to array of digits
  - array of combos for each input integer
    - array of triples, array of doubles
- 1 or 0

# ALGORITHM
- create an array of digit-string from '0' to '9': `digits`
- convert both input integers into strings
- iterate over `digits`
  - select any digits that appear as a triple in first string
  - if no triples, return 0
- check if any selected digits appear as doubles in second string
  - if yes, return 1
  - otherwise return 0

#################################

# PROBLEM

input:

output:

# EXAMPLES


# DATA STRUCTURE(S)


# ALGORITHM

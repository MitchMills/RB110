# PROBLEM
Write a method that takes an integer and returns the largest integer that can be obtained by deleting exactly one digit.

Assume all input integers will contain at least two digits

- input: integer
  - contains at least two digits

- output: integer
  - contains same digits as input integer, with one digit deleted
  - contains one less digit than input integer
  - contains at least one digit
  - must be largest integer available from deleting one digit of input integer

# EXAMPLES
delete_digit(12345) == 2345
delete_digit(54321) == 5432
delete_digit(12321) == 2321
delete_digit(32123) == 3223

delete_digit(791983) == 91983
delete_digit(152) == 52
delete_digit(1001) == 101
delete_digit(10) == 1

# DATA STRUCTURES
- input: integer
  - array of digits
  OR
  - string ***

  - array to hold possible results

- output: integer

# ALGORITHM
- convert input integer into a string
- iterate over a range from 0 up to one less than length of string
  - remove character at index indicated by current number
  - collect these strings in an array
- convert all strings in array to integers
- sort the array
- return the largest number


# # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # #

# PROBLEM


- input: 

- output:

# EXAMPLES


# DATA STRUCTURES


# ALGORITHM

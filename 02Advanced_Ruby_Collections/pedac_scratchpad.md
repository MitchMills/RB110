# PROBLEM
Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.

Write a method that returns one UUID when called with no parameters.

input: nothing
output: string
  - 32 hexadecimal characters
  - broken into 5 sections
    - 8-4-4-4-12
    - separated by dashes

# EXAMPLES
"f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

# DATA STRUCTURE(S)
- list of hexadecimal characters to randomly choose each character from
- array representing `pattern`: [8, 4, 4, 4, 12]
- transform `pattern` into an array: ['f65c57f6', 'a6aa, etc ]
  - each nested array contains a string: can concatenate random characters to it until it is the correct length


# ALGORITHM
- initialize an array of hexadecimal characters: `HEX_CHARACTERS`
- initialize an array representation of the pattern: `PATTERN`
- iterate over `PATTERN`
  - for the current element, add random hexadecimal characters to a string until the string is the length that matches the value of that element
  - store this string in an array
- join the strings in the array with '-' in between


#################################

# PROBLEM


# EXAMPLES


# DATA STRUCTURE(S)


# ALGORITHM

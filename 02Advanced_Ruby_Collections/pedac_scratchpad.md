# PROBLEM
- Write a method that returns one UUID when called with no parameters.

*INPUT*
- Nothing, no parameters
*OUTPUT*
- String

*Rules*
- Each UUID consists of 32 hexadecimal characters
- The characters will be broken into 5 sections
    - Pattern: 8-4-4-4-12
- The UUID will be represented by a string
  - The string will include dashes between each section

*Assumption(s)*
- Will generate each character randomly one at a time and add it to the string instead of generating an 8 character number, then a 4 character number, etc

# EXAMPLES
- "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

# DATA STRUCTURE(S)
- array (to store pattern)
- string

# ALGORITHM
- create an array containing the pattern: [8, 4, 4, 4, 12]
- create an array containing as separate elements 0 through 9 and a through f
- create an empty string 'uuid' to store the uuid as it is built
- iterate over the array
  - for each element, add one randomly generated hex character to 'uuid'
  - unless it's the last element, add a dash to the string
- return the string
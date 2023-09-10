# PROBLEM
Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.

- input: string
  - contains upper and lowercase letters
  - contains non-letter characters, including spaces

- output: new string
  - every other letter is upcased or downcased
  - don't count non-letter characters in figuring out when to toggle

# EXAMPLES
staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
staggered_case('ALL CAPS') == 'AlL cApS'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# DATA STRUCTURES


# ALGORITHM
- initialize an array of all letter characters
- separate the string into an array of characters
- set a toggle to true
- iterate over each character in the array
  - if current character is not a letter, proceed to the next character
  - if current character is a letter:
    - if toggle is true, upcase and set toggle to false
    - if toggle is false, downcase and set toggle to true
  - repeat until the end of the array is reached
- join the characters back into a string
- return that string

# # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # #

# PROBLEM


- input: 

- output:

# EXAMPLES


# DATA STRUCTURES


# ALGORITHM

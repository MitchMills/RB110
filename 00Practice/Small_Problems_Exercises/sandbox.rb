########### Rachele II
# Write a method that takes an array of consecutive letters as input and returns the missing letter.

# p determine_missing_letter(['a','b','c','d','f']) == 'E' 
# p determine_missing_letter(['o','q','r','s']) == 'P'
# p determine_missing_letter(['H','J','K','L']) == 'i'
# p determine_missing_letter([]) == []





############### Rachele I
# For "x", determine how many positive integers less than or equal to "x" are odd but not prime. Assume "x" is an integer between 1 and 10000.

# Example: 5 has three odd numbers (1,3,5) and only the number 1 is not prime, so the answer is 1
# Example: 10 has five odd numbers (1,3,5,7,9) and only 1 and 9 are not prime, so the answer is 2

# A prime number (or a prime) is a natural number greater than 1 that has no positive divisors other than 1 and itself.

# p odd_not_prime(15) == 3
# p odd_not_prime(48) == 10
# p odd_not_prime(82) == 20






=begin
You will be given a number and you will need to return it as a string in expanded form. For example:

expanded_form(12); # Should return '10 + 2'
expanded_form(42); # Should return '40 + 2'
expanded_form(70304); # Should return '70000 + 300 + 4'

Note: All numbers will be whole numbers greater than 0.

p expanded_form(12) == '10 + 2'
p expanded_form(42) == '40 + 2'
p expanded_form(70304) == '70000 + 300 + 4'


.divmod approach
.digits approach
.chars approach

P___________________
input: INTEGER - positive whole number
output: STRING - representation of number as sum of factors of 1, 10, 100, etc
  - if a particular place in the input number is a zero, do not include it in the output string
    - e.g. 70304 has zeros in the 10s and 1000s places: 70000 + 300 + 4
  - do not format output numbers with commas: 70000

E____________________
p expanded_form(12) == '10 + 2'
p expanded_form(42) == '40 + 2'
p expanded_form(70304) == '70000 + 300 + 4'
    - omit zeros in output string for places with a zero in input string
    - don't separate numbers with commas

D____________________
Input: integer
May convert integer to string to get individual digits
May put the separate digits in an array before producing the output string
Need to convert separate integers to strings to add to the output string
Output: string

A____________________
DIVMOD APPROACH

- initialize an empty array: `digits`
- get the quotient and remainder from dividing the input number by 10
- store the remainder in an array (append each digit: 70304 --> [4, 0, 3, 0, 7])
- set number to equal the quotient
- repeat until quotient equals 0

- set `digit_strings` to equal return value from:
  - iterating over `digits` with indexes
      - convert each element into a string
      - concatenate appropriate number of zeros to each string
        - element + ('0' * index) --> ['4', '00', '300', '0000', '70000']
  - reverse order of `digit_strings`
- filter 'digit_strings' for elements that do not have '0' as their first character
- join elements of resulting array with ' + ' between elements
- return resulting string

=end
# def expanded_form(number)
#   digits = []
#   loop do
#     quotient, remainder = number.divmod(10)
#     digits << remainder
#     number = quotient
#     break if quotient == 0
#   end
  
#   digit_strings = digits.map.with_index do |digit, index|
#     digit.to_s + ('0' * index)
#   end.reverse

#   non_zero_digit_strings = digit_strings.select { |string| string[0] != '0'}
#   non_zero_digit_strings.join(' + ')
# end
# _________________
=begin
DIGITS APPROACH
- Get the individual digits of the input number
  - create an array `digits` of individual digits from the input number (Integer#digits)
    - it will be in reverse order: 70304 --> [4, 0, 3, 0, 7]

- Add appropriate number of zeros to each digit
  - set `digit_strings` to equal return value from:
    - iterating over `digits` with indexes
      - convert each digit into a string
      - concatenate appropriate number of zeros to each string
        - digit_string + ('0' * index) --> ['4', '00', '300', '0000', '70000']
  - reverse order of `digit_strings` --> ['70000', '0000', '300', '00', '4']

- Remove places that are only zeros
  - filter 'digit_strings' for elements that do not have '0' as their first character --> ['70000', '300', '4']

- Create and return the output string
  - join elements of filtered array with ' + ' between elements
  - return resulting string --> '70000 + 300 + 4'
=end

# def expanded_form(number)
#   digits = number.digits

#   digit_strings = digits.map.with_index do |digit, index|
#     digit.to_s + ('0' * index)
#   end.reverse

#   digit_strings.select { |string| string[0] != '0'}.join(' + ')
# end
# _________________
=begin
CHARS APPROACH
- create an array `digits` of individual digits from the input number
  - convert the input number into a string
  - convert that string into an array of separate characters (String#chars method)
  - reverse the array

- set `digit_strings_with_zeros` to equal return value from:
  - iterating over `digit_strings` with indexes
      - concatenate appropriate number of zeros to each string
        - element + ('0' * index) --> ['4', '00', '300', '0000', '70000']
  - reverse order of `digit_strings`
- filter 'digit_strings' for elements that do not have '0' as their first character
- join elements of resulting array with ' + ' between elements
- return resulting string
=end

# def expanded_form(number)
#   digit_strings = number.to_s.chars.reverse
#   digit_strings_with_zeros = digit_strings.map.with_index do |digit, index|
#     digit + ('0' * index)
#   end.reverse

#   digit_strings_with_zeros.select { |string| string[0] != '0'}.join(' + ')
# end

def expanded_form(number)
  digit_strings = []

  number.to_s.reverse.each_char.with_index do |character, index|
    digit_strings.prepend(character + ('0' * index))
  end

  digit_strings.select { |digit_string| digit_string[0] != '0' }.join(' + ')
end

p expanded_form(12) #== '10 + 2'
p expanded_form(42) #== '40 + 2'
p expanded_form(70304) #== '70000 + 300 + 4'



################################

# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

=begin
input: string
output: array
  - contains all substrings from input string which are palindromes

RULES
- Explicit
  - case sensitive: 'Dad' is not a palindrome, 'dad' is

- Implicit
  - if input string is empty, return empty array
  - if input string contains no palindrome substrings, return empty array

- Questions
  - Is input always a string? If not, how to handle?
  - what is a substring (can whole input string be a substring?)
  - what is a palindrome? Can a single character be a palindrome?
  - must substrings be in order they appear in input string?
  - what about spaces?
=end

########### RACHELE SESSION II
#### RACHELE II, PROBLEM 2
=begin
Given an array of n positive integers and a positive integer, find the minimal length of a contiguous subarray for which the sum >= integer.

p minSubLength([2, 3, 1, 2, 4, 3], 7) == 2
p minSubLength([1, 10, 5, 2, 7], 9) == 1
p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
p minSubLength([1, 2, 4], 8) == 0
=end


p minSubLength([2, 3, 1, 2, 4, 3], 7) == 2
p minSubLength([1, 10, 5, 2, 7], 9) == 1
p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
p minSubLength([1, 2, 4], 8) == 0





#### RACHELE II, PROBLEM 1
=begin
Write a method that takes an array of consecutive letters as input and returns the missing letter.

p determine_missing_letter(['a','b','c','d','f']) == 'E' 
p determine_missing_letter(['o','q','r','s']) == 'P'
p determine_missing_letter(['H','J','K','L']) == 'i'
p determine_missing_letter([]) == []

PROBLEM__________
Input: array
  - each element is a string
  - each string is a single alphabetic character
  - the elements are in a sequence
  - the sequence is alphabetic, ascending
  - all elements are in the same case
  - a letter is missing from somewhere in the middle of the sequence
  - array can be empty

Output: string OR empty array
  - string is a single alphabetic character
  - it represents the missing letter in the sequence
  - it is in the opposite case from the input array
  - if input array is empty, it is returned instead of a string

Rules
- Explicit
  - input array contains consecutive letters
  - output is the missing letter from sequence
- Implicit
  - input array is in an alphabetical sequence
  - one letter is missing from the middle of the sequence
  - letters in input array are all the same case
  - output letter must be in the opposite case
  - if the input array is empty, return an empty array instead of a string

EXAMPLES__________
p determine_missing_letter(['a','b','c','d','f']) == 'E' 
p determine_missing_letter(['o','q','r','s']) == 'P'
p determine_missing_letter(['H','J','K','L']) == 'i'
p determine_missing_letter([]) == []

DATA STRUCTURES__________
input: array # ['a','b','c','d','f']

array of complete sequence # ['a','b','c','d','e','f']
missing letter # 'e'

output: string # 'E'
        empty array (if input array is empty)

ALGORITHM__________
- Return input array if it is empty

- Create an array containing the full sequence
  - (array[0]..array[-1])

- Determine the missing letter
  - remove all input array letters from the full sequence

- Return the missing letter
  - get missing letter string
  - swap the case
  - return it
=end

# def determine_missing_letter(sequence)
#   return sequence if sequence.empty?

#   full_sequence = (sequence[0]..sequence[-1]).to_a

#   missing_letter = full_sequence - sequence

#   missing_letter.first.swapcase
# end

# p determine_missing_letter(['a','b','c','d','f']) == 'E' 
# p determine_missing_letter(['o','q','r','s']) == 'P'
# p determine_missing_letter(['H','J','K','L']) == 'i'
# p determine_missing_letter([]) == []

############### RACHELE SESSION I
#### RACHELE I, PROBLEM 2
=begin
# For "x", determine how many positive integers less than or equal to "x" are odd but not prime. Assume "x" is an integer between 1 and 10000.

# Example: 5 has three odd numbers (1,3,5) and only the number 1 is not prime, so the answer is 1
# Example: 10 has five odd numbers (1,3,5,7,9) and only 1 and 9 are not prime, so the answer is 2

# A prime number (or a prime) is a natural number greater than 1 that has no positive divisors other than 1 and itself.

**PROBLEM___________________
- for a given number, find the number of positive integers that are:
  - less than OR EQUAL to it &&
  - odd &&
  - not prime

*Input: integer
  - integer must be positive (there are no positive integers less than or equal to a negative number or to 0)

*Output: integer
  - represents the number of positive integers that meet all three criteria

*Rules:
  - Explicit
    - target numbers must meet all three criteria:
      - <= to input integer
      - odd
      - not prime
    - Prime number: integer greater than 1 that has no positive divisors besides 1 and itself
  - Implicit
    - input integer is positive
    - all input integers have at least one odd non-prime number less than or equal to them: 1

Questions:
- do we need to account for input integers that are not positive? I.e. return 0 (probably)
  - Executive Decision: NO

**EXAMPLES___________________
p odd_not_prime(15) == 3 # [1, 3, 5, 7, 9, 11, 13, 15] --> [1, 9, 15]
p odd_not_prime(48) == 10
p odd_not_prime(82) == 20

**DATA STRUCTURES___________________
input: integer # 15

array of all odd numbers <= input integer # [1, 3, 5, 7, 9, 11, 13, 15]
array of all of those numbers which are not prime # [1, 9, 15]

output: integer # 3

**ALGORITHM___________________
- Get all odd numbers between 1 and input integer
  - create a range from 1 up to the input integer
  - select all odd numbers from that range
  - put those nubmers into an array: `odd_numbers`

- Select non-prime numbers
  - create an array `odd_non_primes` containing the number 1: [1]
  - iterate over `odd_numbers`
    - for each `number` in `odd_numbers`
      -iterate each `divisor` between 3 and (`number` - 1)
        - (we've accounted for 1, and 2 only divides evenly into even numbers)
        - (`number` will always divide evenly into itself)
        - if any `divisor` divides evenly (% == 0) into `number`, add `number` to `odd_non_primes`

- Return result
  - the number of unique numbers in `odd_non_primes`
=end

# def odd_not_prime(number)
#   odd_numbers = (1..number).select { |number| number.odd? }

#   odd_non_primes = [1]
#   odd_numbers.each do |number|
#     (3..(number - 1)).step(2).each do |divisor|
#       odd_non_primes << number if number % divisor == 0
#     end
#   end
#   odd_non_primes.uniq.size
# end

# p odd_not_prime(15) == 3
# p odd_not_prime(48) == 10
# p odd_not_prime(82) == 20




############################
#### RACHELE I, PROBLEM 1
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
- Get the individual digits of the input number
  - initialize an empty array: `digits`
  - get the quotient and remainder from dividing the input number by 10
  - store the remainder in `digits` (append each digit: 70304 --> [4, 0, 3, 0, 7])
  - set number to equal the quotient
  - repeat until quotient equals 0

- Add appropriate number of zeros to each digit
  - set `digits_with_zeros` to equal return value from:
    - iterating over `digits` with indexes
      - multiply each digit by 10**index --> [4, 0, 300, 0, 7000]

- Remove places that are only zeros
  - set `non_zero_digits` equal to only elements that are not 0 --> [4, 300, 7000]

- Create and return the output string
  - `digit_strings` = each element of `non_zero_digits` converted to a string
  - reverse `digit_strings`
  - join elements with ' + ' between elements
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
  
#   digits_with_zeros = digits.map.with_index do |digit, index|
#     digit * 10**index
#   end

#   non_zero_digits = digits_with_zeros.select {|digit| digit != 0}

#   digit_strings = non_zero_digits.map(&:to_s).reverse

#   digit_strings.join(' + ')
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

# def expanded_form(number)
#   digit_strings = []

#   number.to_s.reverse.each_char.with_index do |character, index|
#     digit_strings.prepend(character + ('0' * index))
#   end

#   digit_strings.select { |digit_string| digit_string[0] != '0' }.join(' + ')
# end

# p expanded_form(12) #== '10 + 2'
# p expanded_form(42) #== '40 + 2'
# p expanded_form(70304) #== '70000 + 300 + 4'






################################
### PALINDROME SUBSTRINGS
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

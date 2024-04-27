=begin
In the previous two exercises, you developed methods that convert simple numeric strings to signed Integers. In this exercise and the next, you're going to reverse those methods.

Write a method that takes a positive integer or zero, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. Your method should do this the old-fashioned way and construct the string by analyzing and manipulating the number.

PROBLEM 11:36
input: integer
  - positive or zero

output: string
  - represents same number as input integer

EXAMPLES

DATA STRUCTURES
- needs:
  - way to access each digit of input integer individually
  - way to convert digit into string

- input: integer
  - array of individual digits from input integer
  - transformed into strings
  - joined into a single string
- output: string

ALGORITHM
- get individual digits of input integer
  - create an array of each digit from input integer
- convert digits into string equivalents
  - create a hash with digits as keys and strings as values
  - transform array using hash
- create output string
  - join elements of hash and return them
=end

DIGITS_TO_STRINGS = ('0'..'9').to_a

# def integer_to_string(integer)
#   digits = integer.digits.reverse
#   digits.map { |digit| DIGITS_TO_STRINGS[digit] }.join
# end

# def integer_to_string(integer)
#   digits = separate_digits(integer)
#   digits.map { |digit| DIGITS_TO_STRINGS[digit] }.join
# end

# def separate_digits(integer)
#   digits = []
#   loop do
#     integer, remainder = integer.divmod(10)
#     digits.prepend(remainder)
#     break if integer == 0
#   end
#   digits
# end

def integer_to_string(integer)
  result = ''
  loop do
    integer, remainder = integer.divmod(10)
    result.prepend(DIGITS_TO_STRINGS[remainder])
    break if integer == 0
  end
  result
end

p integer_to_string(4321) #== '4321'
p integer_to_string(0) #== '0'
p integer_to_string(5000) #== '5000'

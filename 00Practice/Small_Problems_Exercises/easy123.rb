### REVERSE DIGITS
=begin
Write a method that takes a positive integer as an argument and returns that number with its digits reversed.

Don't worry about arguments with leading zeros - Ruby sees those as octal numbers, which will cause confusing results. For similar reasons, the return value for our fourth example doesn't have any leading zeros.

PROBLEM
input: integer
  - positive
output: integer
  - same digits as input integer, but reversed

EXAMPLES

DATA STRUCTURES
- input: integer
  - integer converted to string
- output: integer

ALGORITHM
- convert the input integer to a string
- reverse the string
- convert the string into an integer and return it
=end

# def reversed_number(number)
#   number.to_s.reverse.to_i
# end

def reversed_number(number)
  reversed_number = 0
  until number == 0
    number, remainder = number.divmod(10)
    reversed_number = reversed_number * 10 + remainder
  end
  reversed_number
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1

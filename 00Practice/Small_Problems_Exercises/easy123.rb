### NEGATIVE
=begin
Write a method that takes a number as an argument. If the argument is a positive number, return the negative of that number. If the number is 0 or negative, return the original number.

PROBLEM
input: integer (or float?)

output: integer (or float?)
  - if integer is positive, return negative
  - if negative or 0, return original number

EXAMPLES

DATA STRUCTURES
needs:
  - way to determine if input integer is positive, negative, or 0

input: integer

output: integer

ALGORITHM
- get the absolute value of the input integer
- convert that value to negative and return it
=end

def negative(number)
  -number.abs
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0

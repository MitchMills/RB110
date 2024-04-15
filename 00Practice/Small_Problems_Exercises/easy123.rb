### 2 ODD
=begin
Write a method that takes one integer argument, which may be positive, negative, or zero. This method returns true if the number's absolute value is odd. You may assume that the argument is a valid integer value.

PROBLEM
input: integer
  - may be negative, zero, or positive
  - valid integer value
output: boolean
  - true if input integer is odd, false otherwise

EXAMPLES

DATA STRUCTURES
- needs:

- input: integer

- output: boolean

ALGORITHM
=end

def is_odd?(number)
  number % 2 != 0
end

p is_odd?(2)    == false
p is_odd?(5)    == true
p is_odd?(-17)  == true
p is_odd?(-8)   == false
p is_odd?(0)    == false
p is_odd?(7)    == true
